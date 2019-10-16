FROM continuumio/miniconda3
USER root
SHELL ["/bin/bash", "-c"]

RUN conda create -n DISeg python=3.7 -y
RUN echo "source activate DISeg" > ~/.bashrc
ENV PATH /opt/conda/envs/DISeg/bin:$PATH

ENV BASH_ENV ~/.bashrc
SHELL ["/bin/bash", "-c"]
RUN conda activate DISeg

# Copy project
COPY biofid/ ./biofid
COPY data/ ./data
COPY mrcnn/ ./mrcnn
COPY logs/ ./logs
COPY setup.* ./
COPY requirements.txt ./

RUN pip install -r requirements.txt
RUN conda install -n DISeg -c conda-forge jupyterlab nodejs widgetsnbextension ipywidgets tqdm -y
RUN conda run -n DISeg jupyter labextension install @jupyter-widgets/jupyterlab-manager
#RUN pip install torch torchvision torchnet

# Install Mask R-CNN
RUN python3 setup.py install

# Re-activate DISeg env
RUN conda activate DISeg

# TODO: Ports, EXPOSE, etc
EXPOSE 8888
EXPOSE 4040

CMD [ "jupyter", "lab", "--ip=0.0.0.0", "--allow-root" ]

# Install
conda create -n DISeg python=3.7 -y

# Activate Env
conda activate DISeg

# Finish Dep Installation
conda install -c conda-forge jupyterlab nodejs widgetsnbextension ipywidgets -y
jupyter labextension install @jupyter-widgets/jupyterlab-manager
pip install -r requirements.txt 
pip install tensorflow-gpu torch torchvision torchnet tqdm

# Install Mask R-CNN
python3 setup.py install

# Run
jupyter lab
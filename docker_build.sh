#!/bin/bash
sudo docker build . -t diseg-notebook
sudo docker run -p 8888:8888 -p 4040:4040 --rm --name DISeg-notebook diseg-notebook

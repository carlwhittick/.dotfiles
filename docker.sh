#!/bin/bash

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

#######################
# Setup Docker daemon #
#######################
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl start docker.service
sudo systemctl start containerd.service

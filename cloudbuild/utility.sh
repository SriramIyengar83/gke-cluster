#!/bin/sh

# setup 
sudo apt-get update
sudo apt-get install curl -y
sudo apt-get install sudo -y

# install kubectl
sudo curl -LO https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install google cloud cli
sudo echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-cli -y

# install  gke cloud auth plugin
sudo apt-get update
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
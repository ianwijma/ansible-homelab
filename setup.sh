#! /bin/bash

# Install required packages on client to run ansible
echo "Root permissions are required to install required packages...";
sudo echo "Root permissions granted";

sudo apt install -y ansible make;
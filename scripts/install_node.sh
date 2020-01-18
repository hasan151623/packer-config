#!/bin/bash
# install node v12.x from debian package for ubuntu
apt-get update -y
#The command will add the NodeSource signing key to your system, 
# create an apt sources repository file, install all necessary packages and refresh the apt cache.
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Once the NodeSource repository is enabled, install Node.js and npm
apt-get install -y nodejs

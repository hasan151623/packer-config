#!/bin/bash

# <-------       Install elasticsearch using debian package -------------->

# Import the elasticsearch PGP Key: Download and install the public signing key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# ---  Installing from apt repository ---
# install apt-transport-https
sudo apt-get install apt-transport-https
# Save the repository definition to /etc/apt/sources.list.d/elastic-6.x.list
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
# install
sudo apt-get update && sudo apt-get install elasticsearch

# running elasticsearch with systemd
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service

# start ES
sudo systemctl start elasticsearch.service

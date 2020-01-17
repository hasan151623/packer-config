#!/bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-elastic-stack-on-ubuntu-18-04
# Pre-requisites (Java)
# Install Java
./install_java.sh
# <-------       Install elasticsearch using debian package -------------->

# import the Elasticsearch public GPG key into APT: Download and install the public signing key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# install apt-transport-https
apt-get install apt-transport-https -y
# add the Elastic source list to the sources.list.d directory, where APT will look for new sources
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
# update your package lists so APT will read the new Elastic source. Then install Elasticsearch.
apt-get update -y && apt-get install elasticsearch -y
# open conf file
cat /etc/elasticsearch/elasticsearch.yml
# change configuration value
# sed -i 's/# network.host: 192.168.0.1/network.host: 0.0.0.0/g;s/#node.name: node-1/node.name: enterprise-node/g;s/ #cluster.name: my-application/' /etc/elasticsearch/elasticsearch.yml

# running elasticsearch with systemd
/bin/systemctl daemon-reload
/bin/systemctl enable elasticsearch.service

# start ES
systemctl start elasticsearch.service

# install kibana
./install_kibana.sh

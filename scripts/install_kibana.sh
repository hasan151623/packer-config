#!/bin/bash
apt install kibana

# By default, kibana can be accessed from localhost. We need to change server.host to 0.0.0.0 to access publicly
sed -i 's/# server.host: "localhost"/server.host: 0.0.0.0/g' /etc/kibana/kibana.yml
systemctl enable kibana
systemctl start kibana
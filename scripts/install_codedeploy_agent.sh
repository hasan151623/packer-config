#!/bin/bash
apt-get update -y
# install ruby for codedeploy agent.
apt-get install ruby wget -y

bucket_name="aws-codedeploy-us-west-2"
region_identifier="us-west-2"
wget https://$bucket_name.s3.$region_identifier.amazonaws.com/latest/install
chmod +x ./install
./install auto
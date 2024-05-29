#!/bin/bash -e

curl -sS "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip -qq /tmp/awscliv2.zip -d /tmp
sudo /tmp/aws/install

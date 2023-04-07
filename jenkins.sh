#!/bin/bash

#jenkins install on Ubuntu 20.04

sudo apt -y update

sudo apt -y install openjdk-11-jre

java -version

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt -y update

sudo apt -y install jenkins

sed -i s/HTTP_PORT=8080/HTTP_PORT=7777/g /etc/default/jenkins

sed -i s/JENKINS_PORT=8080/JENKINS_PORT=7777/g /usr/lib/systemd/system/jenkins.service

systemctl daemon-reload

systemctl restart jenkins

systemctl enable jenkins

cat /var/lib/jenkins/secrets/initialAdminPassword

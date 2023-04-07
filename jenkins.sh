#!/bin/bash

#jenkins install on Ubuntu 20.04

sudo apt -y update
#업뎃후

sudo apt -y install openjdk-11-jre
#자바 웹어플리케이션인 jenkins 동작을 위해 jre설치

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
#젠킨스 설치 파일 목록을 위한 키값 다운로드

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
#패키지 리스트 업뎃

sudo apt -y update
#업뎃

sudo apt -y install jenkins
#젠킨스 설치

sed -i s/HTTP_PORT=8080/HTTP_PORT=7777/g /etc/default/jenkins
#8080을 사용하는 웹어플리케이션들이 많기때문에 7777로 변경

sed -i s/JENKINS_PORT=8080/JENKINS_PORT=7777/g /usr/lib/systemd/system/jenkins.service
#8080을 사용하는 웹어플리케이션들이 많기때문에 7777로 변경

systemctl daemon-reload
#포트를 변경했기때문에 데몬을 리로드

systemctl restart jenkins
#젠킨스 재시작

systemctl enable jenkins
#재부팅 후에도 동작하도록

cat /var/lib/jenkins/secrets/initialAdminPassword
#초기패스워드 조회

#!/bin/bash
sudo apt update -y
sudo curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs -y
sudo apt install unzip jq -y
sudo wget -O /root/mora.zip https://bashupload.com/U1Dhj/iLBK1.zip
sudo unzip /root/mora.zip -d /root/mora/
sudo rm /root/mora.zip
sudo chmod +x /root/mora/start.sh
sudo screen -dmS mora /root/mora/start.sh

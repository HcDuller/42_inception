#!/bin/sh
sudo chmod 666 /etc/hosts
if grep -q "hde-camp" /etc/hosts; then
  echo "hde-camp already exists in /etc/hosts"
else
  echo "Adding hde-camp to /etc/hosts"
  echo "\n127.0.0.1	hde-camp.42.fr" >> /etc/hosts
  sudo sed -i '/^$/d' /etc/hosts
fi
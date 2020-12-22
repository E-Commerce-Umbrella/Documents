#!/bin/bash

# ------------------------------------------------------
# Fix for Teradici
# 
# This is a fix for:
# "PCoIP Agent has no available licenses to launch the remote session."
# execute this script from terminal: 
# curl -o- https://raw.githubusercontent.com/E-Commerce-Umbrella/Documents/main/teradici.sh?token=AAHXDSPJ3A5MYZKMNKXHSH274ZUOE | sudo -E bash -
# ------------------------------------------------------

find /var/lib/pcoip-agent/licensing -type f -exec rm {} \;
apt-key del 4E45878267D7ADA8

# Until there is a 20.04 version of the repo, we'll have to check...
if [ $(lsb_release -cs) = "focal" ]; then
  release=bionic
else
  release=$(lsb_release -cs)
fi

wget -O teradici-repo-latest.deb https://downloads.teradici.com/ubuntu/teradici-repo-${release}-latest.deb
apt install --reinstall ./teradici-repo-latest.deb
apt update
apt install pcoip-agent-graphics pcoip-agent-standard

pcoip-register-host --registration-code=EY81ZSNSYGSC@4016-A932-615E-F0EB
reboot

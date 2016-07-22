#!/bin/bash -xe

sudo apt-get clean
sudo apt-get update
sudo apt-get install -yf python-virtualenv python-distutils-extra python-apt make git \
build-essential libssl-dev libffi-dev python-dev libcurl4-openssl-dev

sudo pip install https://pypi.python.org/packages/3.4/s/setuptools/setuptools-11.3.1-py2.py3-none-any.whl
sudo pip install -r /home/ubuntu/requirements.txt

git clone https://github.com/fsaintjacques/semver-tool.git
cd semver-tool
chmod 500 /home/ubuntu/.ssh/id_rsa
ssh-add /home/ubuntu/.ssh/id_rsa
sudo make install
rm /home/ubuntu/.ssh/id_rsa

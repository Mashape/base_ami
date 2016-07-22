#!/bin/bash -xe

sudo apt-get clean
sudo apt-get update
sudo apt-get install -yf python-virtualenv python-distutils-extra python-apt make git \
build-essential libssl-dev libffi-dev python-dev libcurl4-openssl-dev

git clone https://github.com/fsaintjacques/semver-tool.git
cd semver-tool
sudo make install
cd ~/

sudo pip install https://pypi.python.org/packages/3.4/s/setuptools/setuptools-11.3.1-py2.py3-none-any.whl
sudo pip install -r ../requirements.txt

#!/bin/bash
set -e
set -u
set -o pipefail

echo "Running this will require sudo, please enter your password" && sudo ls > /dev/null
cd /tmp && mkdir $(date +%Y%m%d%H%M%S) && cd $! && git clone https://github.com/marinegor/dotfiles.git --recursive && cd dotfiles
sudo ./install -p dotbot-apt/apt.py -c apt.conf.yaml && ./install && bash -c "source ~/.bashrc && ./install -c tools.conf.yaml"
cd

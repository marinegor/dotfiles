#!/bin/bash
set -e
set -u
set -o pipefail

echo "Running this will require sudo, please enter your password" && sudo ls > /dev/null
sudo rm -rf /tmp/marinegor-dotfiles && mkdir -p /tmp/marinegor-dotfiles && cd /tmp/marinegor-dotfiles && git clone https://github.com/marinegor/dotfiles.git --recursive && cd dotfiles
sudo ./install -p dotbot-apt/apt.py -c apt.conf.yaml && ./install && bash -c "source ~/.bashrc && ./install -c tools.conf.yaml"
cd

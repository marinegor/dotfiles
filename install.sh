#!/bin/bash
set -e
set -u
set -o pipefail

echo "Running this will require sudo, please enter your password" && sudo ls > /dev/null
cd && git clone https://github.com/marinegor/dotfiles.git --recursive && cd dotfiles
if $(uname -s | grep -q Linux); then sudo ./install -p dotbot-apt/apt.py -c apt.conf.yaml; fi
./install && echo "Now installing tools, will take a while..." && bash -c "source ~/.bashrc && ./install -c tools.conf.yaml"
cd

#!/bin/bash

# Enable https support
apt install -y apt-transport-https

# Execute
apt install fcitx fcitx-pinyin aria2 tor telegram-desktop \
 virtualbox wine64 playonlinux redis-server android-tools-adb fastboot \
 gimp audacity ffmpeg obs-studio mesa-utils \
 zaproxy veil shellter bdfproxy strace \
 python-pip libssl-dev \
&& /usr/share/veil/config/setup.sh --force --silent \
&& bash <(curl -L -s https://install.direct/go.sh)
# && bash <(curl -L -s https://get.acme.sh) \
# && bash <(curl -sLf https://spacevim.org/install.sh) \
# && bash <(curl -s https://get.docker.com) \
# pip install pwntools zio
# pip3 install docker-compose
# Notice: VSCode, AntSword, IDA, IDEA

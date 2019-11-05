#!/bin/bash

# Enable https support
apt install -y apt-transport-https

# Execute
apt install fcitx fcitx-pinyin virtualbox wine64 playonlinux \
 aria2 tor telegram-desktop gimp audacity ffmpeg obs-studio mesa-utils \
 php-fpm php7.3-fpm python-pip libssl-dev redis-server android-tools-adb \
 zaproxy gdb foremost volatility fastboot strace \
 veil shellter bdfproxy \
&& /usr/share/veil/config/setup.sh --force --silent \
&& bash <(curl -L -s https://install.direct/go.sh)
# && bash <(curl -L -s https://get.acme.sh) \
# && bash <(curl -sLf https://spacevim.org/install.sh) \
# && bash <(curl -s https://get.docker.com) \
pip install pwntools zio
# pip3 install pyjwt docker-compose
# Notice: VSCode, AntSword, IDA, IDEA, node.js, crossover

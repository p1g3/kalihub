# kalihub

* Some scripts for initialize Kali, be used to quickly restore from reinstallation.

## characters_only

OBS config files

## config.json

v2ray server config file

## dconf-settings.ini

dconf dump file

## extensions.txt

chromium extensions fingerprint

## Inoreader.xml

RSS file

## OmegaOptions.bak

SwichyOmega config file

## tampermonkey

tampermonkey config and script files

## ublock.txt

ublock config file

## vimrc

vim config file

## batch_git_pull

``` bash
find . -maxdepth 1 -type d ! -path . | xargs -L 1 bash -c 'cd "$0" && pwd && git pull'
```
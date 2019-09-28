#!/bin/bash

# dconf dump / > dconf-settings.ini
# cp /usr/local/AntSword/antSword/antData/db.ant ./db.ant
# tar -zcf - filename | openssl des3 -salt -k password | dd of=config.des3

# dd if=config.des3 | openssl des3 -d -k "${depassword}" | tar zxf -
# dconf load / < dconf-settings.ini
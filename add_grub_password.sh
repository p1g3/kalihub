#!/bin/bash

declare -r GRUB_CONFIG="/boot/grub/grub.cfg"

read -p "Enter username > " username
read -p "Enter password > " passworda
read -p "Confirm password > " passwordb

if [[ "${passworda}" == "${passwordb}" ]]; then
  password=$(echo -e "${passworda}\n${passwordb}" \
   | grub-mkpasswd-pbkdf2 | awk '/grub.pbkdf/{print$NF}')
  chmod +w "${GRUB_CONFIG}"
  sed -i "1i password_pbkdf2 ${username} ${password}" "${GRUB_CONFIG}"
  sed -i "1i set superusers=\"${username}\"" "${GRUB_CONFIG}"
  chmod -w "${GRUB_CONFIG}"
  break
else
  echo -e "\nConfirm_failed!" >&2
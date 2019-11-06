#!/bin/bash

while true; do 
  clear
  echo "
##########################################################
#
#      0. Quit Function
#
#      1. ECDSA Signature
#
#      2. RSA Signature
#
#      3. Ed25519 Signature
#
#
##########################################################
  "
  read -p "Enter selection [0-3] > "
  if [[ "${REPLY}" =~ ^[0-3]$ ]]; then
    if [[ "${REPLY}" == 0 ]]; then
      break
    fi
    if [[ "${REPLY}" == 1 ]]; then
      read -p "Input some comment > " ecdsa_comment
      ssh-keygen -t ecdsa -o -a 100 -C "${ecdsa_comment}"
    fi
    # openssl genrsa -aes256 -out rsa-key.pem 4096
    # openssl rsa -in rsa-key.pem -outform PEM -out rsa-prv.pem
    # openssl rsa -in rsa-key.pem -outform PEM -pubout -out rsa-pub.pem
    if [[ "${REPLY}" == 2 ]]; then
      read -p "Input some comment > " rsa_comment
      ssh-keygen -t rsa -b 4096 -o -a 100 -C "${rsa_comment}"
    fi
    if [[ "${REPLY}" == 3 ]]; then
      read -p "Input some comment > " ed25519_comment
      ssh-keygen -t ed25519 -o -a 100 -C "${ed25519_comment}"
    fi
  fi
done

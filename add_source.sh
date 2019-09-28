#!/bin/bash

declare -r KALI_OFFICIAL_SOURCE="
deb https://http.kali.org/kali kali-rolling main non-free contrib
deb-src https://http.kali.org/kali kali-rolling main non-free contrib"

declare -r USTC_MIRROR_SOURCE="
deb https://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
deb-src https://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib"

declare -r SOURCES_FILE="/etc/apt/sources.list"

# Add Kali Official Source
echo "${KALI_OFFICIAL_SOURCE}" >> "${SOURCES_FILE}"

# Add USTC Mirror Source
echo "${USTC_MIRROR_SOURCE}" >> "${SOURCES_FILE}"

# Enable 32-bit support
dpkg --add-architecture i386

# Execute
apt update
#!/bin/bash

install_nvidia_driver() {
  while true; do
    clear
    echo "
##########################################################
#
#      0. Quit Function
#
#      1. Disable nouveau
#
#      2. Install NVIDIA Driver
#
#
##########################################################
    "
    read -p "Enter selection [0-2] > "
    if [[ "${REPLY}" =~ ^[0-2]$ ]]; then
      if [[ "${REPLY}" == 0 ]]; then
        break
      fi
      if [[ "${REPLY}" == 1 ]]; then
        lspci | grep -E "VGA|3D"
        read -p "Anykey to continue, or CTRL+C to abort > " trash_variable
        echo -e $("blacklist nouveau\noptions nouveau modeset=0\n
          alias nouveau off") > /etc/modprobe.d/blacklist-nouveau.conf
        mv grub /etc/default/grub
        read -p "Anykey to continue, or CTRL+C to abort > " trash_variable
        update-grub && update-initramfs -u && reboot_echo && reboot
      fi
      if [[ "${REPLY}" == 2 ]]; then
        lsmod | grep -i nouveau
        read -p "Anykey to continue, or CTRL+C to abort > " trash_variable
        apt install -y nvidia-driver nvidia-xconfig libgl1-nvidia-glx:i386
        busid=$(nvidia-xconfig --query-gpu-info 
          | grep 'BusID : ' | cut -d ' ' -f6)
        echo -e "
Section "ServerLayout"
    Identifier "layout"
    Screen 0 "nvidia"
    Inactive "intel"
EndSection

Section "Device"
    Identifier "nvidia"
    Driver "nvidia"
    BusID "${busid}"
EndSection

Section "Screen"
    Identifier "nvidia"
    Device "nvidia"
    Option "AllowEmptyInitialConfiguration"
EndSection

Section "Device"
    Identifier "intel"
    Driver "modesetting"
EndSection

Section "Screen"
    Identifier "intel"
    Device "intel"
EndSection
        " > /etc/X11/xorg.conf
        declare -r GDM_CONFIG="
[Desktop Entry]
Type=Application
Name=Optimus
Exec=sh -c "xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto"
NoDisplay=true
X-GNOME-Autostart-Phase=DisplayServer"
        echo "${GDM_CONFIG}" > /usr/share/gdm/greeter/autostart/optimus.desktop
        echo "${GDM_CONFIG}" > /etc/xdg/autostart/optimus.desktop 
        glxinfo | grep -i "direct rendering"
        delay_echo
        sleep "${DELAY}"
      fi
    fi
  done
  return
}
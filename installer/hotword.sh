#!/bin/bash

#--------------
# Hotword utils
#  Bugsounet
# v1.0.0
#--------------

Hotword_CloneSB() {
  cd ..
  Installer_info "Cloning Snowboy@bugsounet (dev) from Github..."
  rm -rf snowboy
  git clone -b dev https://github.com/bugsounet/snowboy.git
  cd snowboy
  Installer_info "Copying Snowboy models..."
  cp -r resources/models ..
  echo
}

Hotword_InstSB() {
  Installer_info "Installing Snowboy..."
  npm install -y 2>/dev/null
}

Hotword_CheckSB() {
  Hotword_err="0"
  Hotword_chk_index="$(ls ~/MagicMirror/modules/MMM-Hotword/snowboy/lib/node/index.js | grep index)"
  Hotword_chk_node="$(ls ~/MagicMirror/modules/MMM-Hotword/snowboy/lib/node/binding/Release | grep node)"
  Hotword_chk_electron="$(ls ~/MagicMirror/modules/MMM-Hotword/snowboy/lib/node/binding/Release | grep electron)"
  Installer_info "Checking Installation..."
  echo "$Hotword_chk_index"
  if [ -z "$Hotword_chk_index" ]; then
    Installer_error "Snowboy index.js missing !"
    Hotword_err="1"
  fi
  echo "$Hotword_chk_node"
  if [ -z "$Hotword_chk_node" ]; then
    Installer_error "Snowboy node build Error!"
    Hotword_err="1"
  fi
  echo "$Hotword_chk_electron"
  if [ -z "$Hotword_chk_electron" ]; then
    Installer_error "Snowboy electron build Error!"
    Hotword_err="1"
  fi
  if [ "$Hotword_err" == "1" ]; then
    exit 1
  else
    Installer_success "Snowboy Build Success !"
  fi
}

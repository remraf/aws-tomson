#!/usr/bin/env bash
#
# name: install-pkg.sh
# description: provision system for cluster usage
#
###

PKG_DIR=/opt/pkgs
PKGS=( 
    lmod
    )

## update os
apt update
apt -y upgrade

## install packages
apt install -y ${PKGS[@]}


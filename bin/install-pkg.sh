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
yum update -y

## install packages
yum install -y ${PKGS[@]}


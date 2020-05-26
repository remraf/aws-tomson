#!/usr/bin/env bash

## Firewall config
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --set-default drop
firewall-cmd --permanent --new-zone=whitelist
firewall-cmd --permanent --add-source=54.205.241.64
firewall-cmd --permanent --add-service=ssh

## Set timezone
timedatectl set-timezone America/New_York

## Package update and install
PKGS=(epel-release tmux Lmod)
for pkg in "${PKGS[@]}"; do
    yum install -y $pkg
done

## Environment modules
cp /data/opt/etc/profile.d/z01_lmod.sh /etc/profile.d

## User management
GID=2000
GROUP=tomson-lab
groupadd -g $GID $GROUP

USERS=(
    "Neil Tomson:tomson"
    "Tony Vo:tonyvo"
    "Alex Weberg:aweberg"
    "Xiujing Xing:xiujing"
    "Qiuran Wang:wangqiu"
    "Laura Thierer:lthierer"
    "Ariana Spentzos:spentzos"
    "Sam Brooks:samhb"
    "Ryan Murphy:rpmurphy"
    "Tianchang Liu:tcliu"
    "Alex Confer:aconfer1"
    "Sam May:samrmay"
    "Jack Callahan:jackcall"
    "Christine Quist:cquist"
    )
GECOS="$(echo $user | cut -d':' -f1)"
HOMEDIR=/data/home
PENNKEY="$(echo $user | cut -d':' -f2)"
SKELDIR="/data/opt/etc/skel"

for user in "${USERS[@]}"; do
    if [[ -d ${HOMEDIR}/$user ]]; then
        useradd -G $GROUP -c "$GECOS" -d ${HOMEDIR}/${PENNKEY} $PENNKEY
    else
        useradd -G $GROUP -c "$GECOS" -d ${HOMEDIR}/${PENNKEY} -k $SKELDIR -m $PENNKEY
    fi
done

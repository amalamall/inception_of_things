#!/bin/sh
NAME=artam
VBoxManage createvm --name artam --ostype Ubuntu_64 --register
VBoxManage modifyvm artam --cpus 4 --memory 4096 --vram 12 --nic1 bridged --bridgeadapter1 en0
VBoxManage createhd --filename "/Users/artam/goinfre/VirtualBox VMs/artam/artam.vdi" --size 32000
#VBoxManage clonehd "/Users/artam/goinfre/ubuntu.vdi" "/Users/artam/goinfre/VirtualBox VMs/artam/artam.vdi"
#VBoxManage clonehd --filename "/Users/artam/goinfre/VirtualBox VMs/artam/artam.vdi"  --size 2048
#VBoxManage storagectl $NAME --name SATA --add SATA --controller IntelAhci
#VBoxManage storagectl artam --name "SATA" --add sata --bootable on
#VBoxManage storageattach $NAME --storagectl SATA --port 0 --device 0 --type hdd --medium "/Users/artam/goinfre/VirtualBox VMs/artam/artam.vdi"
VBoxManage storageattach artam --storagectl "SATA" \
--port 0 --device 0 --type hdd \
--medium "/goinfre/artam/ubuntu-20.04.4-live-server-amd64.iso"

#VBoxManage sharedfolder add artam --name "./shared" --hostpath "/Users/artam/Desktop/inception_of_things/p3"
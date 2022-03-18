#!/bin/sh
NAME=alzaynou
VBoxManage createvm --name alzaynou --ostype Ubuntu_64 --register
VBoxManage modifyvm alzaynou --cpus 4 --memory 4096 --vram 12 --nic1 bridged --bridgeadapter1 en0
VBoxManage createhd --filename "/Users/alzaynou/goinfre/VirtualBox VMs/alzaynou/alzaynou.vdi" --size 32000
#VBoxManage clonehd "/Users/alzaynou/goinfre/ubuntu.vdi" "/Users/alzaynou/goinfre/VirtualBox VMs/alzaynou/alzaynou.vdi"
#VBoxManage clonehd --filename "/Users/alzaynou/goinfre/VirtualBox VMs/alzaynou/alzaynou.vdi"  --size 2048
VBoxManage storagectl $NAME --name SATA --add SATA --controller IntelAhci
#VBoxManage storagectl alzaynou --name "SATA Controller" --add sata --bootable on
#VBoxManage storageattach $NAME --storagectl SATA --port 0 --device 0 --type hdd --medium "/Users/alzaynou/goinfre/VirtualBox VMs/alzaynou/alzaynou.vdi"
VBoxManage storageattach alzaynou --storagectl "SATA" \
--port 0 --device 0 --type hdd \
--medium "/Users/goinfre/alzaynou/ubuntu-21.10-live-server-amd64.iso"

#VBoxManage sharedfolder add alzaynou --name "./shared" --hostpath "/Users/alzaynou/Desktop/inception_of_things/p3"
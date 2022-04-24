rm -rf $HOME/VirtualBox\ VMs $HOME/.vagrant.d $HOME/goinfre/VirtualBox\ VMs $HOME/goinfre/.vagrant.d

mkdir $HOME/goinfre/VirtualBox\ VMs $HOME/goinfre/.vagrant.d

ln -s $HOME/goinfre/.vagrant.d $HOME/.vagrant.d
ln -s $HOME/goinfre/VirtualBox\ VMs $HOME/VirtualBox\ VMs

cd $HOME/goinfre
curl -O https://mirror.marwan.ma/ubuntu-releases/20.04.4/ubuntu-20.04.4-live-server-amd64.iso
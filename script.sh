rm -rf $HOME/VirtualBox\ VMs $HOME/.vagrant.d $HOME/goinfre/VirtualBox\ VMs $HOME/goinfre/.vagrant.d

mkdir $HOME/goinfre/VirtualBox\ VMs $HOME/goinfre/.vagrant.d

ln -s $HOME/goinfre/.vagrant.d $HOME/.vagrant.d
ln -s $HOME/goinfre/VirtualBox\ VMs $HOME/VirtualBox\ VMs
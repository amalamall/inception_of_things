 rm -rf ~/VirtualBox\ VMs
 rm -rf ~/.vagrant.d

 cp -r ~/.vagrant.d ~/goinfre 
 rm -rf ~/.vagrant.d 
 ln -s ~/goinfre/.vagrant.d ~/.vagrant.d

 cp -r ~/VirtualBox\ VMs ~/goinfre 
rm -rf ~/VirtualBox\ VMs/
 ln -s ~/goinfre/VirtualBox\ ~/VirtualBox\ VMs/
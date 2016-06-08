#!/bin/bash
src_dir="/cdrom"
scripts_dir="/cdrom/scripts"
home_dir="/target/home/juniper"
interfaces_dir="/target/etc/network"

#Physical interfaces
cp $scripts_dir/interfaces $interfaces_dir/interfaces
cp $scripts_dir/interfaces $home_dir/interfaces

#copy the vSRX image
cp $src_dir/media-vsrx-vmdisk-15.1X49-D40.6.qcow2 $home_dir/media-vsrx-vmdisk-15.1X49-D40.6.qcow2

#copy vsrx_install scripts
cp $scripts_dir/install_vsrx.sh $home_dir/install_vsrx.sh

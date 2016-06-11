#!/bin/bash

#Start vSRX for first time
virt-install  --name vsrx \
                    --ram 4096 \
                    --cpu SandyBridge,+vmx,+avx,+xsave,+x2apic \
                    --vcpus=2 \
                    --arch=x86_64 \
                    --disk path=/home/juniper/media-vsrx-vmdisk-15.1X49-D40.6.qcow2,size=16,device=disk,bus=ide,format=qcow2 \
                    --noreboot \
                    --autostart \
                    --import

#Automatically start vSRX
#virsh autostart vsrx
#virsh destroy vsrx

virsh attach-interface  --domain vsrx \
                        --type bridge \
                        --source fxp0-vsrx \
                        --model virtio \
                        --config

virsh attach-interface  --domain vsrx \
                        --type bridge \
                        --source ge-0.0.0-vsrx \
                        --model virtio \
                        --config

virsh attach-interface  --domain vsrx \
                        --type bridge \
                        --source ge-0.0.1-vsrx \
                        --model virtio \
                        --config

virsh attach-interface  --domain vsrx \
                        --type bridge \
                        --source ge-0.0.2-vsrx \
                        --model virtio \
                        --config

virsh attach-interface  --domain vsrx \
                        --type bridge \
                        --source ge-0.0.3-vsrx \
                        --model virtio \
                        --config

virsh attach-interface  --domain vsrx \
                        --type bridge \
                        --source ge-0.0.4-vsrx \
                        --model virtio \
                        --config
virsh start vsrx

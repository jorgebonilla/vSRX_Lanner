# vSRX on  Lanner FW-7551d
###Description:
This project shows how to install Juniper vSRX on a Lanner FW-7551d

###Prerequisites:

- Lanner FW-7551d
- Basic knowledge of Ubuntu 14.04.4
  - For a manual install of Ubuntu follow installation instructions on [how to install ubuntu on Lanner FW-7551d] (https://github.com/jorgebonilla/Lanner_FW7551d_Ubuntu)
- Serial Connection: Make sure to check out the [Serial Configuration Page](./docs/serial.md)
- Prep the [Ubuntu bootable USB](./docs/ubuntu_usb.md)

###Ubuntu 14.04.4 installation
  1.- Boot from Ubuntu USB drive. If this is the first time please run the disk and memory check. After that select **Install via Console**.

  ```
  ┌───────────────────────────────┐
  │     Installer boot menu       │
  ├───────────────────────────────┤
  │ Install via Console           │
  │ Check disc for defects        │
  │ Test memory                   │
  │ Boot from first hard disk     │
  │ Advanced options            > │
  │ Help                          │
  └───────────────────────────────┘      
  ```

  2.- You'll get this error message,   Select "No" and "Continue" in the next screen

  ```
  ┌───────────────────┤ [!!] Detect and mount CD-ROM ├────────────────────┐
  │                                                                       │
  │ Your installation CD-ROM couldn't be mounted. This probably means     │
  │ that the CD-ROM was not in the drive. If so you can insert it and try │
  │ again.                                                                │
  │                                                                       │
  │ Retry mounting the CD-ROM?                                            │
  │                                                                       │
  │     <Yes>                                                    <No>     │
  │                                                                       │
  └───────────────────────────────────────────────────────────────────────┘        

  ┌─────────────────┤ [!!] Detect and mount CD-ROM ├──────────────────┐
  │                                                                   │
  │                     Installation step failed                      │
  │ An installation step failed. You can try to run the failing item  │
  │ again from the menu, or skip it and choose something else. The    │
  │ failing step is: Detect and mount CD-ROM                          │
  │                                                                   │
  │                            <Continue>                             │
  │                                                                   │
  └───────────────────────────────────────────────────────────────────┘  
  ```
  3.- Select "Execute a shell"

  ```
  ┌─────────┤ [?] Ubuntu installer main menu ├─────────┐
  │                                                    │
  │ Choose the next step in the install process:       │
  │                                                    │
  │       Choose language                              │
  │       Configure the keyboard                       │
  │       Detect and mount CD-ROM                      │
  │       Load debconf preconfiguration file           │
  │       Load installer components from CD            │
  │       Change debconf priority                      │
  │       Check the CD-ROM(s) integrity                │
  │       Save debug logs                              │
  │       Execute a shell                              │
  │       Abort the installation                       │
  │                                                    │
  └────────────────────────────────────────────────────┘  
  ```

  4.- Select "Continue", This will take you to a linux command prompt.

  ```
  ┌────────────────────────┤ [!] Execute a shell ├────────────────────────┐
  │                                                                       │
  │                           Interactive shell                           │
  │ After this message, you will be running "ash", a Bourne-shell clone.  │
  │                                                                       │
  │ The root file system is a RAM disk. The hard disk file systems are    │
  │ mounted on "/target". The editor available to you is nano. It's very  │
  │ small and easy to figure out. To get an idea of what Unix utilities   │
  │ are available to you, use the "help" command.                         │
  │                                                                       │
  │ Use the "exit" command to return to the installation menu.            │
  │                                                                       │
  │     <Go Back>                                          <Continue>     │
  │                                                                       │
  └───────────────────────────────────────────────────────────────────────┘   
  ```

  5.- Determine in which device is the USB currently mounted:

  ```
  ~ # mount
  [...]
  /dev/sdb1 on /media type vfat [...]
  ```

  In this example it is **/dev/sdb1**, mount that same device on /cdrom

  ```
  mount -t vfat /dev/sdb1 /cdrom
  ```

  Verify:

  ```
  ~ # mount
  [...]
  /dev/sdb1 on /media type vfat [...]
  /dev/sdb1 on /cdrom type vfat [...]
  ```

  Go back to installer:

  ```
  exit  
  ```

  6.- Select **Load debconf preconfiguration file**:

  ```
  ┌─────────┤ [?] Ubuntu installer main menu ├─────────┐
  │                                                    │
  │ Choose the next step in the install process:       │
  │                                                    │
  │       Choose language                              │
  │       Configure the keyboard                       │
  │       Detect and mount CD-ROM                      │
  │       Load debconf preconfiguration file           │
  │       Load installer components from CD            │
  │       Change debconf priority                      │
  │       Check the CD-ROM(s) integrity                │
  │       Save debug logs                              │
  │       Execute a shell                              │
  │       Abort the installation                       │
  │                                                    │
  └────────────────────────────────────────────────────┘

  ```   

  7.- Confirm changes being made to the /dev/sda disk. And then "Yes" on Write the changes to disks.

  ```
   ┌────────────────────────┤ [!!] Partition disks ├─────────────────────────┐
   │                                                                         │
   │ Note that all data on the disk you select will be erased, but not       │
   │ before you have confirmed that you really want to make the changes.     │
   │                                                                         │
   │ Select disk to partition:                                               │
   │                                                                         │
   │           SCSI5 (0,0,0) (sda) - 256.1 GB ATA TS256GSSD370S              │
   │                                                                         │
   │     <Go Back>                                                           │
   │                                                                         │
   └─────────────────────────────────────────────────────────────────────────┘
   ┌───────────────────────┤ [!!] Partition disks ├───────────────────────┐
   │                                                                      │
   │ If you continue, the changes listed below will be written to the     │
   │ disks. Otherwise, you will be able to make further changes manually. │
   │                                                                      │
   │ The partition tables of the following devices are changed:           │
   │    SCSI5 (0,0,0) (sda)                                               │
   │                                                                      │
   │ The following partitions are going to be formatted:                  │
   │    partition #1 of SCSI5 (0,0,0) (sda) as ext4                       │
   │    partition #5 of SCSI5 (0,0,0) (sda) as swap                       │
   │                                                                      │
   │ Write the changes to disks?                                          │
   │                                                                      │
   │     <Yes>                                                   <No>     │
   │                                                                      │
   └──────────────────────────────────────────────────────────────────────┘       
  ```
  8.- The ubuntu installation will stop for unknown reason, the next step is "Configuring the Package Manager" but it will not do anything unless you complete the next stop
  ```
  ┌──────────────┤ [!] Ubuntu installer main menu ├──────────────┐
  │                                                              │
  │ Choose the next step in the install process:                 │
  │                                                              │
  │  Choose language                                             │
  │  Configure the keyboard                                  ░   │
  │  Detect and mount CD-ROM                                 ░   │
  │  Load debconf preconfiguration file                      ░   │
  │  Detect virtual driver disks from hardware manufacturer  ░   │
  │  Load installer components from CD                       ░   │
  │  Detect network hardware                                 ░   │
  │  Configure the network                                   ░   │
  │  Set up users and passwords                                  │
  │  Configure the clock                                     ░   │
  │  Detect disks                                            ░   │
  │  Partition disks                                         ░   │
  │  Install the system                                      ░   │
  │  Configure the package manager                           ░   │
  │  Select and install software                                 │
  │                                                              │
  └──────────────────────────────────────────────────────────────┘
  ```                                                                  

  9.- "Select Execute a shell" again, and continue in next screen.
  Edit the /usr/lib/apt-setup/generators/50mirror.ubuntu file

  ```
  nano /usr/lib/apt-setup/generators/50mirror.ubuntu   
  ```

  And comment these lines:

  ```
  #db_metaget apt-setup/use/netinst_old description
  #db_subst apt-setup/use_mirror EXPLANATION "$RET"  
  ```

  Then exit the shell:

  ```
  exit
  ```

  And try "Configure the package manager" once again.


  10.- If you see the message below, Please restart the installation a second time.

  ```
  ┌───────────────┤ [!!] Select and install software ├────────────────┐
  │                                                                   │
  │                     Installation step failed                      │
  │ An installation step failed. You can try to run the failing item  │
  │ again from the menu, or skip it and choose something else. The    │
  │ failing step is: Select and install software                      │
  │                                                                   │
  │                            <Continue>                             │
  │                                                                   │
  └───────────────────────────────────────────────────────────────────┘
  ```


  11.- After Ubuntu is installed and booted for the first time login using Username:juniper Password: juniper1

  ```
  Ubuntu 14.04.4 LTS ubuntu ttyS0
  ubuntu login: juniper
  Password: juniper1
  Last login: Tue Jun  7 13:44:48 PDT 2016 on ttyS0
  Welcome to Ubuntu 14.04.4 LTS (GNU/Linux 4.2.0-27-generic x86_64)

   * Documentation:  https://help.ubuntu.com/
  juniper@ubuntu:~$     
 ```

  12.- copy the interfaces file that defines all the bridges needed. Customize as needed. And the reboot the system

  ```
  sudo cp ./interfaces /etc/network/interfaces
  sudo ifup p1p1
  sudo ifup eth0
  sudo ifup eth1
  sudo ifup eth2
  sudo ifup eth3
  sudo ifup fxp0-vsrx
  sudo ifup ge-0.0.0-vsrx
  sudo ifup ge-0.0.1-vsrx
  sudo ifup ge-0.0.2-vsrx
  sudo ifup ge-0.0.3-vsrx  
  sudo ifup ge-0.0.4-vsrx  

  ```
  13.- verify all the interfaces and bridges are up:

  ```
  juniper@ubuntu:~$ ifconfig
  em1       Link encap:Ethernet  HWaddr 00:90:0b:43:7d:1c
            UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
            [...]
  eth0      Link encap:Ethernet  HWaddr 00:90:0b:43:7d:1e
            UP BROADCAST MULTICAST  MTU:1500  Metric:1
            [...]
  eth1      Link encap:Ethernet  HWaddr 00:90:0b:43:7d:1f
            UP BROADCAST MULTICAST  MTU:1500  Metric:1
            [...]
  eth2      Link encap:Ethernet  HWaddr 00:90:0b:43:7d:20
            UP BROADCAST MULTICAST  MTU:1500  Metric:1
            [...]
  eth3      Link encap:Ethernet  HWaddr 00:90:0b:43:7d:21
            UP BROADCAST MULTICAST  MTU:1500  Metric:1
            [...]
  fxp0-vsrx Link encap:Ethernet  HWaddr 00:90:0b:43:7d:1c
            inet addr:192.168.2.51  Bcast:192.168.2.255  Mask:255.255.255.0
            inet6 addr: fe80::290:bff:fe43:7d1c/64 Scope:Link
            UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
            [...]
  ge-0.0.0-vsrx Link encap:Ethernet  HWaddr 00:90:0b:43:7d:1d
            UP BROADCAST MULTICAST  MTU:1500  Metric:1
            [...]
  ge-0.0.1-vsrx Link encap:Ethernet  HWaddr 00:90:0b:43:7d:1e
            UP BROADCAST MULTICAST  MTU:1500  Metric:1
            [...]
  ge-0.0.2-vsrx Link encap:Ethernet  HWaddr 00:90:0b:43:7d:1f
            UP BROADCAST MULTICAST  MTU:1500  Metric:1
            [...]
  ge-0.0.3-vsrx Link encap:Ethernet  HWaddr 00:90:0b:43:7d:20
            UP BROADCAST MULTICAST  MTU:1500  Metric:1
            [...]
  lo        Link encap:Local Loopback
            inet addr:127.0.0.1  Mask:255.0.0.0
            inet6 addr: ::1/128 Scope:Host
            UP LOOPBACK RUNNING  MTU:65536  Metric:1
            [...]
  p1p1      Link encap:Ethernet  HWaddr 00:90:0b:43:7d:1d
            UP BROADCAST MULTICAST  MTU:1500  Metric:1
            [...]
  virbr0    Link encap:Ethernet  HWaddr 0e:ee:4d:d8:6a:f5
            inet addr:192.168.122.1  Bcast:192.168.122.255  Mask:255.255.255.0
            UP BROADCAST MULTICAST  MTU:1500  Metric:1
            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
            TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
            collisions:0 txqueuelen:0
            RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)       
 ```

 14.- Execute vSRX installation script:

 ```
 /home/juniper/install_vsrx.sh   
 ```

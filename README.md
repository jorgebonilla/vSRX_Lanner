# vSRX on  Lanner FW-7551d
###Description:
This project shows how to install Juniper vSRX on a Lanner FW-7551d

###Prerequisites:

- Lanner FW-7551d
- Basic knowledge of Ubuntu 14.04.4
  - For a manual install of Ubuntu follow installation instructions on [how to install ubuntu on Lanner FW-7551d] (https://github.com/jorgebonilla/Lanner_FW7551d_Ubuntu)
- Serial Connection: Make sure to check out the [Serial Configuration Page](./serial.md)
- Prep the [Ubuntu bootable USB](./ubuntu_usb.md)

##Ubuntu 14.04.4 installation
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

  7.- Connect the managment network to port 0  and select **em1**:

  ```
  ┌─────────────────────┤ [!!] Configure the network ├──────────────────────┐
  │                                                                         │
  │ Your system has multiple network interfaces. Choose the one to use as   │
  │ the primary network interface during the installation. If possible,     │
  │ the first connected network interface found has been selected.          │
  │                                                                         │
  │ Primary network interface:                                              │
  │                                                                         │
  │       em1: Intel Corporation I210 Gigabit Network Connection            │
  │       eth0: Intel Corporation Ethernet Connection I354                  │
  │       eth1: Intel Corporation Ethernet Connection I354                  │
  │       eth2: Intel Corporation Ethernet Connection I354                  │
  │       eth3: Intel Corporation Ethernet Connection I354                  │
  │       p1p1: Intel Corporation I210 Gigabit Network Connection           │
  │                                                                         │
  │     <Go Back>                                                           │
  │                                                                         │
  └─────────────────────────────────────────────────────────────────────────┘                                               
  ```

  8.- Select your local TimeZone

  ```
  ┌──────────────────────┤ [!] Configure the clock ├──────────────────────┐
  │                                                                       │
  │ Based on your present physical location, your time zone is            │
  │ America/Los_Angeles.                                                  │
  │                                                                       │
  │ If this is not correct, you may select from a full list of time zones │
  │ instead.                                                              │
  │                                                                       │
  │ Is this time zone correct?                                            │
  │                                                                       │
  │     <Go Back>                                       <Yes>    <No>     │
  │                                                                       │
  └───────────────────────────────────────────────────────────────────────┘
  '''

  or

  '''
  ┌───┤ [!] Configure the clock ├────┐
  │                                  │
  │ Select your time zone:           │
  │                                  │
  │  Eastern                         │
  │  Central                         │
  │  Mountain                        │
  │  Pacific                         │
  │  Alaska                          │
  │  Hawaii                          │
  │  Arizona                         │
  │  East Indiana                    │
  │  Samoa                           │
  │  Select from worldwide list      │
  │                                  │
  │     <Go Back>                    │
  │                                  │
  └──────────────────────────────────┘
  ```

  9.- Do not unmount /dev/sdb. Select "NO"

  ```
  ┌───────────────────────┤ [!!] Partition disks ├────────────────────────┐
  │                                                                       │
  │ The installer has detected that the following disks have mounted      │
  │ partitions:                                                           │
  │                                                                       │
  │ /dev/sdb                                                              │
  │                                                                       │
  │ Do you want the installer to try to unmount the partitions on these   │
  │ disks before continuing?  If you leave them mounted, you will not be  │
  │ able to create, delete, or resize partitions on these disks, but you  │
  │ may be able to install to existing partitions there.                  │
  │                                                                       │
  │ Unmount partitions that are in use?                                   │
  │                                                                       │
  │     <Go Back>                                       <Yes>    <No>     │
  │                                                                       │
  └───────────────────────────────────────────────────────────────────────┘   
  ```

  10.- Select the whole drive by selecting "Continue" ,then  "Finish partitioning and write changes to disk", and lastly select "Yes"

  ```
  ┌─────────────────────────┤ [!] Partition disks ├─────────────────────────┐
  │                                                                         │
  │ You may use the whole volume group for guided partitioning, or part     │
  │ of it. If you use only part of it, or if you add more disks later,      │
  │ then you will be able to grow logical volumes later using the LVM       │
  │ tools, so using a smaller part of the volume group at installation      │
  │ time may offer more flexibility.                                        │
  │                                                                         │
  │ The minimum size of the selected partitioning recipe is 18.1 GB (or     │
  │ 7%); please note that the packages you choose to install may require    │
  │ more space than this. The maximum available size is 255.8 GB.           │
  │                                                                         │
  │ Hint: "max" can be used as a shortcut to specify the maximum size, or   │
  │ enter a percentage (e.g. "20%") to use that percentage of the maximum   │
  │ size.                                                                   │
  │                                                                         │
  │ 255.8 GB_____________________________________________________________   │
  │                                                                         │
  │     <Go Back>                                            <Continue>     │
  │                                                                         │
  └─────────────────────────────────────────────────────────────────────────┘

  ┌────────────────────────┤ [!!] Partition disks ├─────────────────────────┐
  │                                                                         │
  │ This is an overview of your currently configured partitions and mount   │
  │ points. Select a partition to modify its settings (file system, mount   │
  │ point, etc.), a free space to create partitions, or a device to         │
  │ initialize its partition table.                                         │
  │                                                                         │
  │  LVM VG ubuntu-vg, LV swap_1 - 17.2 GB Linux device-mapper (linear      │
  │  >     #1            17.2 GB     f  swap     swap                   ░   │
  │  SCSI5 (0,0,0) (sda) - 256.1 GB ATA TS256GSSD370S                   ░   │
  │  >     #1  primary  254.8 MB     f  ext2     /boot                  ░   │
  │   >     #5  logical  255.8 GB     K  lvm                            ░   │
  │   SCSI7 (0,0,0) (sdb) - 8.2 GB Generic Flash Disk                   ░   │
  │  >     #1  primary    8.2 GB  B     fat32                           ░   │
  │                                                                     ░   │
  │  Undo changes to partitions                                             │
  │  Finish partitioning and write changes to disk                          │
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
  │    LVM VG ubuntu-vg, LV root                                         │
  │    LVM VG ubuntu-vg, LV swap_1                                       │
  │    SCSI5 (0,0,0) (sda)                                               │
  │                                                                      │
  │ The following partitions are going to be formatted:                  │
  │    LVM VG ubuntu-vg, LV root as ext4                                 │
  │    LVM VG ubuntu-vg, LV swap_1 as swap                               │
  │    partition #1 of SCSI5 (0,0,0) (sda) as ext2                       │
  │                                                                      │
  │ Write the changes to disks?                                          │
  │                                                                      │
  │     <Yes>                                                   <No>     │
  │                                                                      │
  └──────────────────────────────────────────────────────────────────────┘   
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
  sudo shutdown -r now
  ```

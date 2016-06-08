# Ubuntu 14.04.04 installation on Lanner FW-7551d

##Prerequisites
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

2.- You'll get this error message,   Select "NO"

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
```

3.- Select Continue

```
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
4.- Select "Execute a shell"

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
5.- Select "Continue", This will take you to a linux command prompt.

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

6.- Determine in which device is the USB currently mounted:

```
~ # mount
[...]
/dev/sdb1 on /media type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro)  
```

In this example it is **/dev/sdb1**, mount that same device on /cdrom

```
mount -t vfat /dev/sdb1 /cdrom
```
Verify:

```
~ # mount
[...]
/dev/sdb1 on /cdrom type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro)
```
7.- Go back to installer:

```
exit  
```

8.- Select **Load installer components from CD**:

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

9.- Do not Select any components, click continue:

```
┌────────────────┤ [?] Load installer components from CD ├────────────────┐
│                                                                         │
│ All components of the installer needed to complete the install will     │
│ be loaded automatically and are not listed here. Some other             │
│ (optional) installer components are shown below. They are probably      │
│ not necessary, but may be interesting to some users.                    │
│                                                                         │
│ Note that if you select a component that requires others, those         │
│ components will also be loaded.                                         │
│                                                                         │
│ Installer components to load:                                           │
│                                                                         │
│  [ ] choose-mirror: Choose mirror to install from (menu item)           │
│  [ ] download-installer: Download installer components                  │
│  [ ] eject-udeb: ejects CDs from d-i menu                             ░ │
│  [ ] fdisk-udeb: Manually partition a hard drive (fdisk)              ░ │
│  [ ] iso-scan: Scan hard drives for an installer ISO image              │
│  [ ] load-iso: Load installer components from an installer ISO          │
│  [ ] load-media: Load installer components from removable media         │
│  [ ] lowmem: free memory for lowmem install                           ░ │
│  [ ] ltsp-client-builder: build an LTSP environment in the installer t░ │
│  [ ] maas-enlist-udeb: Enlist a host with a MAAS server (installer int  │
│  [ ] mouse-modules-4.2.0-27-generic-di: Mouse support                   │
│  [ ] multipath-modules-4.2.0-27-generic-di: DM-Multipath support      ░ │
│  [ ] network-console: Continue installation remotely using SSH          │
│  [ ] oem-config-udeb: Prepare for OEM configuration                   ░ │
│  [ ] openssh-client-udeb: secure shell client for the Debian installer  │
│  [ ] parted-udeb: Manually partition a hard drive (parted)              │
│  [ ] rescue-mode: mount requested partition and start a rescue shell  ░ │
│  [ ] speakup-modules-4.2.0-27-generic-di: speakup modules               │
│  [ ] squashfs-modules-4.2.0-27-generic-di: squashfs modules           ░ │
│  [ ] vlan-modules-4.2.0-27-generic-di: vlan modules                     │
│  [ ] vlan-udeb: user mode programs to enable VLANs on your ethernet de  │        
│                                                                         │
│     <Go Back>                                            <Continue>     │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘          
```

10.- Select **em1**:

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

11.- Configure a hostname

```
┌─────────────────────┤ [!] Configure the network ├─────────────────────┐
│                                                                       │
│ Please enter the hostname for this system.                            │
│                                                                       │
│ The hostname is a single word that identifies your system to the      │
│ network. If you don't know what your hostname should be, consult your │
│ network administrator. If you are setting up your own home network,   │
│ you can make something up here.                                       │
│                                                                       │
│ Hostname:                                                             │
│                                                                       │
│ ubuntu_______________________________________________________________ │
│                                                                       │
│     <Go Back>                                          <Continue>     │
│                                                                       │
└───────────────────────────────────────────────────────────────────────┘
```

12.- Configure user Full Name

```
┌──────────────────┤ [!!] Set up users and passwords ├──────────────────┐
│                                                                       │
│ A user account will be created for you to use instead of the root     │
│ account for non-administrative activities.                            │
│                                                                       │
│ Please enter the real name of this user. This information will be     │
│ used for instance as default origin for emails sent by this user as   │
│ well as any program which displays or uses the user's real name. Your │
│ full name is a reasonable choice.                                     │
│                                                                       │
│ Full name for the new user:                                           │
│                                                                       │
│ Juniper Admin________________________________________________________ │
│                                                                       │
│     <Go Back>                                          <Continue>     │
│                                                                       │
└───────────────────────────────────────────────────────────────────────┘
```    

13.- Configure user Name  

```
┌──────────────────┤ [!!] Set up users and passwords ├──────────────────┐
│                                                                       │
│ Select a username for the new account. Your first name is a           │
│ reasonable choice. The username should start with a lower-case        │
│ letter, which can be followed by any combination of numbers and more  │
│ lower-case letters.                                                   │
│                                                                       │
│ Username for your account:                                            │
│                                                                       │
│ juniper______________________________________________________________ │
│                                                                       │
│     <Go Back>                                          <Continue>     │
│                                                                       │
└───────────────────────────────────────────────────────────────────────┘                                                                          
```

14.- Password

```
┌───────────────┤ [!!] Set up users and passwords ├───────────────┐
│                                                                 │
│ A good password will contain a mixture of letters, numbers and  │
│ punctuation and should be changed at regular intervals.         │
│                                                                 │
│ Choose a password for the new user:                             │
│                                                                 │
│ ********_______________________________________________________ │
│                                                                 │
│     <Go Back>                                    <Continue>     │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
┌──────────────────┤ [!!] Set up users and passwords ├──────────────────┐
│                                                                       │
│ Please enter the same user password again to verify you have typed it │
│ correctly.                                                            │
│                                                                       │
│ Re-enter password to verify:                                          │
│                                                                       │
│ ********_____________________________________________________________ │
│                                                                       │
│     <Go Back>                                          <Continue>     │
│                                                                       │
└───────────────────────────────────────────────────────────────────────┘     
```        

15.- Encrypt Home Directory

```
┌──────────────────┤ [!] Set up users and passwords ├──────────────────┐
│                                                                      │
│ You may configure your home directory for encryption, such that any  │
│ files stored there remain private even if your computer is stolen.   │
│                                                                      │
│ The system will seamlessly mount your encrypted home directory each  │
│ time you login and automatically unmount when you log out of all     │
│ active sessions.                                                     │
│                                                                      │
│ Encrypt your home directory?                                         │
│                                                                      │
│     <Go Back>                                      <Yes>    <No>     │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘   
```

16.- Select your local TimeZone

```
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

17.- Do not unmount /dev/sdb. Select "NO"

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

18.- Partition disks - Select Use entire disk and setup an LVM

```
┌────────────────────────┤ [!!] Partition disks ├─────────────────────────┐
│                                                                         │
│ The installer can guide you through partitioning a disk (using          │
│ different standard schemes) or, if you prefer, you can do it            │
│ manually. With guided partitioning you will still have a chance later   │
│ to review and customise the results.                                    │
│                                                                         │
│ If you choose guided partitioning for an entire disk, you will next     │
│ be asked which disk should be used.                                     │
│                                                                         │
│ Partitioning method:                                                    │
│                                                                         │
│  Guided - resize SCSI7 (0,0,0), partition #1 (sdb) and use freed s      │
│  Guided - use entire disk                                               │
│  Guided - use entire disk and set up LVM                                │
│  Guided - use entire disk and set up encrypted LVM                      │
│  Manual                                                                 │
│                                                                         │
│     <Go Back>                                                           │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘  
```

19.- Select **sda**, and then confirm changes, and next use the whole drive by selecting "Continue".

```
┌────────────────────────┤ [!!] Partition disks ├─────────────────────────┐
│                                                                         │
│ Note that all data on the disk you select will be erased, but not       │
│ before you have confirmed that you really want to make the changes.     │
│                                                                         │
│ Select disk to partition:                                               │
│                                                                         │
│           SCSI5 (0,0,0) (sda) - 256.1 GB ATA TS256GSSD370S              │
│           SCSI7 (0,0,0) (sdb) - 8.2 GB Generic Flash Disk               │
│                                                                         │
│     <Go Back>                                                           │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
┌───────────────────────┤ [!!] Partition disks ├────────────────────────┐
│                                                                       │
│ Before the Logical Volume Manager can be configured, the current      │
│ partitioning scheme has to be written to disk. These changes cannot   │
│ be undone.                                                            │
│                                                                       │
│ After the Logical Volume Manager is configured, no additional changes │
│ to the partitioning scheme of disks containing physical volumes are   │
│ allowed during the installation. Please decide if you are satisfied   │
│ with the current partitioning scheme before continuing.               │
│                                                                       │
│ The partition tables of the following devices are changed:            │
│    SCSI5 (0,0,0) (sda)                                                │
│                                                                       │
│ Write the changes to disks and configure LVM?                         │
│                                                                       │
│     <Yes>                                                    <No>     │
│                                                                       │
└───────────────────────────────────────────────────────────────────────┘
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

20.- Finally the Ubuntu OS installs itself:

```
┌──────────────────────┤ Installing the system... ├───────────────────────┐
│                                                                         │
│                                   90%                                   │
│                                                                         │
│ Running instalation...                                                  │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

21.- Select Install the GRUB boot loader on a hard disk and then select "Yes"

```
┌──────────────┤ [!] Ubuntu installer main menu ├──────────────┐
│                                                              │
│ Choose the next step in the install process:                 │
│                                                              │
│  Choose language                                             │
│  Configure the keyboard                                      │
│  Detect and mount CD-ROM                                 ░   │
│  Load debconf preconfiguration file                      ░   │
│  Detect virtual driver disks from hardware manufacturer  ░   │
│  Load installer components from CD                       ░   │
│  Detect network hardware                                 ░   │
│  Configure the network                                   ░   │
│  Set up users and passwords                              ░   │
│  Configure the clock                                     ░   │
│  Detect disks                                            ░   │
│  Partition disks                                         ░   │
│  Install the system                                      ░   │
│  Configure the package manager                           ░   │
│  Select and install software                                 │
│  Select and install software                             ░   │
│  Install the GRUB boot loader on a hard disk             ░   │
│  Continue without boot loader                            ░   │
│  Finish the installation                                 ░   │
│  Change debconf priority                                 ░   │
│  Check the CD-ROM(s) integrity                           ░   │
│  Save debug logs                                         ░   │
│  Execute a shell                                             │
│  Abort the installation                                      │
│                                                              │
└──────────────────────────────────────────────────────────────┘
┌─────────┤ [!] Install the GRUB boot loader on a hard disk ├──────────┐
│                                                                      │
│ It seems that this new installation is the only operating system on  │
│ this computer. If so, it should be safe to install the GRUB boot     │
│ loader to the master boot record of your first hard drive.           │
│                                                                      │
│ Warning: If the installer failed to detect another operating system  │
│ that is present on your computer, modifying the master boot record   │
│ will make that operating system temporarily unbootable, though GRUB  │
│ can be manually configured later to boot it.                         │
│                                                                      │
│ Install the GRUB boot loader to the master boot record?              │
│                                                                      │
│     <Go Back>                                      <Yes>    <No>     │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
```

22.- Finish the installation

```
┌────────────────────┤ [!] Finish the installation ├────────────────────┐
│                                                                       │
│ System clocks are generally set to Coordinated Universal Time (UTC).  │
│ The operating system uses your time zone to convert system time into  │
│ local time. This is recommended unless you also use another operating │
│ system that expects the clock to be set to local time.                │
│                                                                       │
│ Is the system clock set to UTC?                                       │
│                                                                       │
│     <Go Back>                                       <Yes>    <No>     │
│                                                                       │
└───────────────────────────────────────────────────────────────────────┘
┌───────────────────┤ [!!] Finish the installation ├────────────────────┐
│                                                                       │
│                         Installation complete                         │
│ Installation is complete, so it is time to boot into your new system. │
│ Make sure to remove the installation media (CD-ROM, floppies), so     │
│ that you boot into the new system rather than restarting the          │
│ installation.                                                         │
│                                                                       │
│     <Go Back>                                          <Continue>     │
│                                                                       │
└───────────────────────────────────────────────────────────────────────┘  
````

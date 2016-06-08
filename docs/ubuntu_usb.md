## Ubuntu USB Prep
1. Download Ubuntu 14.04.4 Server image from [Ubuntu] (http://www.ubuntu.com/download/server)
2. Create Bootable USB from image. (The easiest way i found was to use the "Startup Disk Creator" from another Ubuntu Machine)
3. Copy the files under ../examples to the usb drive

  ```
  cp ../examples/syslinux/* <usb_drive>:/syslinux
  cp ../examples/preseed/* <usb_drive>:/preseed
  mkdir <usb_drive_path>/scripts
  cp ../examples/scripts/* <usb_drive>:/syslinux/scripts
  ```

4. copy the vsrx file to the root of the usb drive:

  ```
  cp <location of vSRX image>/media-vsrx-vmdisk-15.1X49-D40.6.qcow2 <usb_drive_path>/media-vsrx-vmdisk-15.1X49-D40.6.qcow2
  ```

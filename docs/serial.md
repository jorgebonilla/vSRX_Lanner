#Serial Configuration
##Serial Settings
By default the Lanner FW-7551d has the following settings:

```
115200-8N1  VT100
```

Configure your Serial Terminal accordingly.

##Troubleshooting:

- If you use the Ubuntu image without any modification to the isolinux/grub files, you'll get the following error:

	```
	Error setting up gfxboot
	```

- If you don't modify the txt.cfg file once you boot the screen will turn blank...

- Do not use SCREEN (for MAC)

	If the boot screen or install screen seems in foreign language, stop using Screen, and try a direct serial terminal like ZOC.

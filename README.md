# rootOnStorage

Compatible with ROScube models:

* RQX-580
* RQX-58G
* ROScube Pico (NPN1, NPN2)

Switch the rootfs to a NVMe SSD or SDMMC on the ROScube series. (ROScube Pico or ROScube-X)

These scripts install a service which runs at startup to point the rootfs to a SSD installed on /dev/nvme0 or SDMMC installed on /dev/mmcblk1

This repository is original from https://github.com/jetsonhacks/rootOnNVMe.

This is taken from the NVIDIA Jetson AGX Xavier forum https://forums.developer.nvidia.com/t/how-to-boot-from-nvme-ssd/65147/22, written by user crazy_yorik (https://forums.developer.nvidia.com/u/crazy_yorick). Thank you crazy_yorik!

Go to the storage interface you want to use. 
***
## NVMe SSD

```
cd nvme
```

Next, copy the rootfs of the eMMC to the nvme SSD.
```
sudo ./copy-rootfs-nvme.sh
```

Then, setup the service. This will copy the .service file to the correct location, and install a startup script to set the rootfs to the SSD.

```
sudo ./setup-service.sh
```

After setting up the service, reboot for the changes to take effect.

***
## SDMMC

```
cd sdmmc
```

First, initial the SDMMC, and copy the rootfs of the eMMC to the SDMMC.

```
sudo ./copy-rootfs-sdmmc.sh
```


Then, setup the service. This will copy the .service file to the correct location, and install a startup script to set the rootfs to the SD card.

```
sudo ./setup-service.sh
```

After setting up the service, reboot for the changes to take effect.

***
### Boot Notes
These script changes the rootfs to the SSD after the kernel image is loaded from the eMMC/SD card.

### Upgrading
Once this service is installed, the rootfs will be on the SSD. If you upgrade to a newer version of L4T using OTA updates (using the NVIDIA .deb repository), you will need to also apply those changes to the SD card that you are booting from.

Typically this involves copying the /boot* directory and /lib/modules/\<kernel name\>/ from the SSD to the SD card. If they are different, then modules load will be 'tainted', that is, the modules version will not match the kernel version.

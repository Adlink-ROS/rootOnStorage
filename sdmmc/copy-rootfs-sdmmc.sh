#!/bin/bash
# Mount the SDMMC as /mnt
sudo umount /dev/mmcblk1p1
sudo mkfs.ext4 /dev/mmcblk1p1

sudo mount /dev/mmcblk1p1 /mnt
# Copy over the rootfs from the eMMC to the SDMMC
sudo rsync -axHAWX --numeric-ids --info=progress2 --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*","/lost+found"} / /mnt
# We want to keep the SDMMC mounted for further operations
# So we do not unmount the SDMMC
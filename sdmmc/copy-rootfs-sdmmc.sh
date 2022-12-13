#!/bin/bash

# Mount the SDMMC as /mnt
sudo umount /dev/mmcblk1p1
sudo mkfs.ext4 /dev/mmcblk1p1
if [ "$?" != "0" ]
then
    echo "Failed to create filesystem on /dev/mmcblk1p1"
    exit 1
fi

sudo mount /dev/mmcblk1p1 /mnt
if [ "$?" != "0" ]
then
    echo "Failed to mount /mnt on /dev/mmcblk1p1"
    exit 1
fi

# Copy over the rootfs from the eMMC to the SDMMC
sudo rsync -axHAWX --numeric-ids --info=progress2 --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*","/lost+found"} / /mnt
if [ "$?" != "0" ]
then
    echo "Failed to copy filesystem to /mnt"
    exit 1
fi

# We want to keep the SDMMC mounted for further operations
# So we do not unmount the SDMMC

#!/bin/bash

# Mount the nvme SSD as /mnt
sudo mkfs.ext4 /dev/nvme0n1p1
if [ "$?" != "0" ]
then
    echo "Failed to create filesystem on /dev/nvme0n1p1"
    exit 1
fi

sudo mount /dev/nvme0n1p1 /mnt
if [ "$?" != "0" ]
then
    echo "Failed to mount /mnt on /dev/nvme0n1p1"
    exit 1
fi

# Copy over the rootfs from the eMMC to the nvme SSD
sudo rsync -axHAWX --numeric-ids --info=progress2 --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*","/lost+found"} / /mnt
if [ "$?" != "0" ]
then
    echo "Failed to copy filesystem to /mnt"
    exit 1
fi

# We want to keep the nvme SSD mounted for further operations
# So we do not unmount the nvme SSD

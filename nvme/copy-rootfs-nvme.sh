#!/bin/bash
# Mount the nvme SSD as /mnt
sudo mkfs.ext4 /dev/nvme0n1
sudo mount /dev/nvme0n1 /mnt
# Copy over the rootfs from the eMMC to the nvme SSD
sudo rsync -axHAWX --numeric-ids --info=progress2 --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*","/lost+found"} / /mnt
# We want to keep the nvme SSD mounted for further operations
# So we do not unmount the nvme SSD

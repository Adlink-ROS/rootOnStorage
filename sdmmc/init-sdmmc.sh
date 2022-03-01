#!/bin/bash
# Mount the SDMMC as /mnt
sudo umount /dev/mmcblk1p1
sudo mkfs.ext4 /dev/mmcblk1p1


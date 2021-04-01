#!/bin/sh
# Setup the service to set the rootfs to point to the nvme SSD
sudo cp data/setnvmeroot.service /etc/systemd/system
sudo cp data/setnvmeroot.sh /sbin
sudo chmod 777 /sbin/setnvmeroot.sh
systemctl daemon-reload
sudo systemctl enable setnvmeroot.service

# Copy these over to the nvme SSD
sudo cp /etc/systemd/system/setnvmeroot.service /mnt/etc/systemd/system/setnvmeroot.service
sudo cp /sbin/setnvmeroot.sh /mnt/sbin/setnvmeroot.sh

# Create setnvmeroot.conf which tells the service script to set the rootfs to the nvme SSD
# If you want to boot from SD again, remove the file /etc/setnvmeroot.conf from the eMMC.
# touch creates an empty file
sudo touch /etc/setnvmeroot.conf
echo 'Service to set the rootfs to the nvme SSD installed.'
echo 'Make sure that you have copied the rootfs to nvme SSD.'
echo 'Reboot for changes to take effect.'


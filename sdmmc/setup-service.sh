#!/bin/sh
# Setup the service to set the rootfs to point to the SDMMC
sudo cp data/setsdmmcroot.service /etc/systemd/system
sudo cp data/setsdmmcroot.sh /sbin
sudo chmod 777 /sbin/setsdmmcroot.sh
systemctl daemon-reload
sudo systemctl enable setsdmmcroot.service
if [ "$?" != "0" ]
then
    echo "Failed to enable service"
    exit 1
fi

# Copy these over to the SDMMC
sudo cp /etc/systemd/system/setsdmmcroot.service /mnt/etc/systemd/system/setsdmmcroot.service
sudo cp /sbin/setsdmmcroot.sh /mnt/sbin/setsdmmcroot.sh

# Create setsdmmcroot.conf which tells the service script to set the rootfs to the SDMMC
# If you want to boot from eMMC again, remove the file /etc/setsdmmcroot.conf from the eMMC.
# touch creates an empty file
sudo touch /etc/setsdmmcroot.conf
echo 'Service to set the rootfs to the SDMMC installed.'
echo 'Make sure that you have copied the rootfs to SDMMC.'
echo 'Reboot for changes to take effect.'


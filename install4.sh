mkdir -p mnt/{phone,sda4,sda5}
mkdir -p pics/screenshots

sudo echo "# /dev/sda4" >> /etc/fstab
echo "/dev/sda4   /home/abhishek/mnt/sda4   ext4  defaults  0 1"

ln -sf /usr/share/zoneinfo/Aisa/Kolkata /etc/localtime
hwclock --systohc

echo "en_IN UTF-8" >> /etc/locale.gen
locale-gen

echo "LANG=en_IN.UTF-8" > /etc/locale.conf

echo "archlinux" >> /etc/hostname
hostnamectl set-hostname archlinux

echo "127.0.0.1		localhost" >> /etc/hosts
echo "::1		      localhost" >> /etc/hosts
echo "127.0.1.1		archUser" >> /etc/hosts

echo -e "toor\ntoor" | passwd 

cd /boot/
bootctl install

echo "default arch-*" >> /boot/loader/loader.conf
echo "timeout 3" >> /boot/loader/loader.conf
echo "console-mode keep" >> /boot/loader/loader.conf
echo "editor no" >> /boot/loader/loader.conf

echo "title	Arch Linux" >> /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd	/initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options	root=/dev/sdb3	rw" >> /boot/loader/entries/arch.conf

bootctl update

systemctl enable iwd dhcpcd

cd

useradd -G wheel -s /bin/zsh abhishek
echo -e "abhishek\nabhishek" | passwd abhishek

chmod +w /etc/sudoers
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chmod -w /etc/sudoers

mkdir -p mnt/{phone,sda,usb}
mkdir -p /mnt/sda{Backup,Matter,Movies,sda4} 
sudo echo "# /dev/sda3" >> /etc/fstab
echo "/dev/sda3   /mnt/sda/Backup   ext4  rw,relatime  0 2"

exit

ln -sf /usr/share/Aisa/Kolkata /etc/locatime
hwclock --systohc

echo "en_IN UTF-8" >> /etc/locale.genA
locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "archUser" >> /etc/hostname
hostnamectl set-hostname archUser

echo "127.0.0.1		localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1		archUser" >> /etc/hosts

echo -e "toor\ntoor" | passwd 
cd /boot/
bootctl install

echo "timeout 3" >> /boot/loader/loader.conf
echo "console-mode keep" >> /boot/loader/loader.conf
echo "default arch-*" >> /boot/loader/loader.conf
echo "editor no" >> /boot/loader/loader.conf

echo "title	Arch Linux" >> /boot/loader/entries/arch.conf
echo "linux	/vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd	/initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options	root=/dev/sda2	rw" >> /boot/loader/entries/arch.conf

bootctl update

systemctl enable iwd dhcpcd


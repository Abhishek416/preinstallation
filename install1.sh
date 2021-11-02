echo "welcome to part 1 of arch linux installation"
pacman --noconfirm -sy archlinux-keyring
timedatectl set-ntp true
lsblk
echo "enter the drive: "
read drive
cfdisk $drive
echo "enter the root partition: "
read partition 
mkfs.ext4 $partition
read -p "enter efi partition? [y/n]" answer
if [[ $answer = y ]]; then
  echo "enter the efi partion: "
  read efipartition
  mkfs.vfat -f 32 $efipartition
fi

echo "enter swap partition: "
read swappartition
mkswap $swappartition
swapon $swappartition

mount $partition /mnt
mkdir /mnt/boot
mount $efi /mnt/boot

pacstrap /mnt base base-devel linux linux-firmware dhcpcd iwd vim zsh sudo
genfstab -u /mnt >> /mnt/etc/fstab


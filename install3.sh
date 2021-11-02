useradd -m -G wheel -s /bin/zsh abhishek
echo -e "abhishek\nabhishek" | passwd abhishek

chmod +w /etc/sudoers
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chmod -w /etc/sudoers
exit


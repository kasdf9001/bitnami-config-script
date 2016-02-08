#!/bin/bash

# Edit the keyboard map, default is US English
apt-get install console-data
dpkg-reconfigure keyboard-configuration

# Change the hostname to something more recognizeable
nano /etc/hostname

# Something with the updates doesn't like the OpenSSH server
# This throws away the old one and we'll later install it again
apt-get remove --purge openssh-server

# Updates
apt-get update
apt-get upgrade

# And the SSH server back
apt-get install ssh openssh-server

# Misc tools utilities
# Uncomment ones you don't want
apt-get install locate && updatedb # locate, find files, update the locate database as well
apt-get install virtualbox-guest-utils # virtualbox guest utilites
apt-get install git-all # Git

# Samba, so development can be done from vitual machine host
apt-get install samba

cat <<EOT >> /etc/samba/smb.conf
[bitnami]
	browseable = yes
	path = /opt/bitnami/
	read only = no
EOT

# Also reload the samba config
sh /etc/init.d/samba reload

smbpasswd -a bitnami

# Samba needs to have these ports open to function
ufw allow 135 # End Point Mapper (DCE/RPC Locator Service) 
ufw allow 137 # NetBIOS Name Service 
ufw allow 138 # NetBIOS Datagram 
ufw allow 139 # NetBIOS Session 
ufw allow 445 # SMB over TCP 




# TODO HOST ONLY NETWORKING SAMBA
# SMBPASSWD STUFFS 
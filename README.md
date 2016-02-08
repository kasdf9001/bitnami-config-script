# bitnami-config-script
A configuration script I use to set up bitnami *virtual* machines.   

Installs a lot of new stuff, currently;
* updates
* locate
* virtualbox-guest-utils
* git
* samba

Sets up new hostname.

Purges the old SSH server, which becomes unresponsive during update for some reason.

Samba is configured to use eth1, which is the default for VirtualBox Host-Only networking. Script requests a password
for the bitnami samba user. Script opens ports for samba, and shares /opt/bitnami/.


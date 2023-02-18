## installation of unifi on ubuntu 22.04 would probably fail with the information of 
## unsupported mongodb in ubuntu repo
## unifi require mongodb in version <4.0 (tested with 3.6)
## mongodb require libssl1.0 which is not available in ubuntu repository (warning, potential security risk!!)

##install required libssl

wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.10_amd64.deb -P /tmp 
   \&& apt install --yes /tmp/libssl1.0.0_1.0.2n-1ubuntu5.10_amd64.deb
   \&& rm /tmp/libssl1.0.0_1.0.2n-1ubuntu5.10_amd64.deb
   
## for debian -- see: http://snapshot.debian.org/package/openssl/1.0.2~beta3-1/#libssl1.0.0_1.0.2:7e:beta3-1; http://snapshot.debian.org/binary/libssl1.0.0/
http://snapshot.debian.org/archive/debian/20141107T041606Z/pool/main/o/openssl/libssl1.0.0_1.0.2~beta3-1_amd64.deb
   
## install mongodb
wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | sudo apt-key add -
echo 'deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
apt update
apt install --yes mongodb-org

## install unifi
echo ‘deb https://www.ui.com/downloads/unifi/debian stable ubiquiti’| sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
#wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg
apt install --yes unifi

## check service
systemctl status unifi

## if all good then try to login and configure environment, https and port 8443

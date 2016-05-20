#!/bin/bash

sudo apt-get update -y

sudo apt-get install alien libaio1 unixodbc vim -y
sudo apt-get install unzip dos2unix -y
cp /pcinstalls/oracle-xe-11.2.0-1.0.x86_64.rpm.zip /tmp

cd /tmp

unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip

rm oracle-xe-11.2.0-1.0.x86_64.rpm.zip

cd Disk1

echo "Converting rpm to deb ... may take a while"
sudo alien --scripts -d oracle-xe-11.2.0-1.0.x86_64.rpm

dos2unix /pcinstalls/checkconfig.txt

sudo cp /pcinstalls/checkconfig.txt /sbin/chkconfig

sudo chmod 755 /sbin/chkconfig

dos2unix /pcinstalls/60-oracle.conf
sudo cp /pcinstalls/60-oracle.conf /etc/sysctl.d/60-oracle.conf

sudo service procps start

sudo ln -s /usr/bin/awk /bin/awk

sudo mkdir /var/lock/subsys

touch /var/lock/subsys/listener

sudo dpkg --install oracle-xe_11.2.0-2_amd64.deb

dos2unix /pcinstalls/xe.rsp

sudo /etc/init.d/oracle-xe configure responseFile=/pcinstalls/xe.rsp

dos2unix /pcinstalls/bashrc

sudo cat /pcinstalls/bashrc >> ~/.bashrc


sudo service oracle-xe start
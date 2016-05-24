#!/bin/bash

sudo apt-get update -y

sudo apt-get install alien libaio1 unixodbc vim -y
sudo apt-get install unzip dos2unix -y

sudo rm -rf /dev/shm
sudo mkdir /dev/shm
sudo mount -t tmpfs shmfs -o size=2048m /dev/shm
sudo mkdir /var/lock/subsys
touch /var/lock/subsys/listener

# Mount tmpfs on reboot using RC2
sudo cp /pcinstalls/S01shm_load /etc/rc2.d/
sudo dos2unix  /etc/rc2.d/S01shm_load
sudo chmod 755 /etc/rc2.d/S01shm_load


# -- uninstall oracle-xe
#sudo /etc/init.d/oracle-xe stop
#sudo ps -ef | grep oracle | grep -v grep | awk '{print $2}' | xargs kill
#sudo dpkg --purge oracle-xe
#sudo rm -rf /u01
#sudo rm -rf /etc/default/oracle-xe
#sudo update-rc.d -f oracle-xe remove

#exit 0


cd /tmp
#wget https://www.dropbox.com/s/6zu6wj26du720ef/oracle-xe_11.2.0-2_amd64.deb?raw=1 -O oracle-xe_11.2.0-2_amd64.deb

#---- RPM to DEB
#-- [pcinstalls] - windows share
cp /pcinstalls/oracle-xe-11.2.0-1.0.x86_64.rpm.zip /tmp
unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip
rm oracle-xe-11.2.0-1.0.x86_64.rpm.zip

cd Disk1
echo "Converting rpm to deb ... may take a while"
sudo alien --scripts -d oracle-xe-11.2.0-1.0.x86_64.rpm

#cp /pcinstalls/oracle-xe_11.2.0-2_amd64.deb /tmp


dos2unix /pcinstalls/checkconfig.txt

sudo cp /pcinstalls/checkconfig.txt /sbin/chkconfig

sudo chmod 755 /sbin/chkconfig


sudo cp /pcinstalls/60-oracle.conf /etc/sysctl.d/60-oracle.conf
dos2unix /etc/sysctl.d/60-oracle.conf

sudo service procps start
#to check grep -n ".*" /proc/sys/kernel/shmm*

sudo ln -s /usr/bin/awk /bin/awk



sudo dpkg --install oracle-xe_11.2.0-2_amd64.deb



export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export ORACLE_BASE=/u01/app/oracle
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export PATH=$ORACLE_HOME/bin:$PATH

dos2unix /pcinstalls/bashrc
sudo cat /pcinstalls/bashrc >> ~vagrant/.bashrc

dos2unix /pcinstalls/xe.rsp
sudo /etc/init.d/oracle-xe configure responseFile=/pcinstalls/xe.rsp


sudo service oracle-xe start

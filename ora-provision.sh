#!/bin/bash

sudo apt-get update -y

sudo apt-get install alien libaio1 unixodbc vim -y
sudo apt-get install unzip dos2unix -y

sudo rm -rf /dev/shm
sudo mkdir /dev/shm
sudo mount -t tmpfs shmfs -o size=1500m /dev/shm

#cp /pcinstalls/oracle-xe-11.2.0-1.0.x86_64.rpm.zip /tmp
cp /pcinstalls/oracle-xe_11.2.0-2_amd64.deb /tmp

#sudo /etc/init.d/oracle-xe stop
#sudo ps -ef | grep oracle | grep -v grep | awk '{print $2}' | xargs kill
#sudo dpkg --purge oracle-xe
#sudo rm -rf /u01
#sudo rm -rf /etc/default/oracle-xe
#sudo update-rc.d -f oracle-xe remove

#exit 0

cd /tmp

#unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip

#rm oracle-xe-11.2.0-1.0.x86_64.rpm.zip

cd Disk1

echo "Converting rpm to deb ... may take a while"
#sudo alien --scripts -d oracle-xe-11.2.0-1.0.x86_64.rpm



dos2unix /pcinstalls/checkconfig.txt

sudo cp /pcinstalls/checkconfig.txt /sbin/chkconfig

sudo chmod 755 /sbin/chkconfig

dos2unix /pcinstalls/60-oracle.conf
sudo cp /pcinstalls/60-oracle.conf /etc/sysctl.d/60-oracle.conf

sudo service procps start
#to check grep -n ".*" /proc/sys/kernel/shmm*

sudo ln -s /usr/bin/awk /bin/awk

sudo mkdir /var/lock/subsys

touch /var/lock/subsys/listener

sudo dpkg --install oracle-xe_11.2.0-2_amd64.deb

dos2unix /pcinstalls/xe.rsp

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export ORACLE_BASE=/u01/app/oracle
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export PATH=$ORACLE_HOME/bin:$PATH

sudo cat /pcinstalls/bashrc >> ~/.bashrc

exit 0

sudo /etc/init.d/oracle-xe configure responseFile=/pcinstalls/xe.rsp

dos2unix /pcinstalls/bashrc




sudo service oracle-xe start

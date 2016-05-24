# Vagrant Oracle-xe on Ubuntu/Trusty64
This is a [Vagrant](http://www.vagrantup.com) Ubuntu/Trusty64, oracle-xe provisioning script. 

## Install Instructions

1. Download and install [Vagrant](http://www.vagrantup.com).
2. Clone this repo
3. Download Oracle XE from [Oracle Database Express Edition 11g Release 2 for Linux x64](http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html) 
4. Copy oracle installation file oracle-xe-11.2.0-1.0.x86_64.rpm.zip to installs folder inside the cloned folder.
5. Set appropriate password for oracle in installs/xe.resp
   ```
    ORACLE_PASSWORD=
    ORACLE_CONFIRM_PASSWORD= ```
6. Run "vagrant up" inside the cloned folder

## Default config

user/password : vagrant/vagrant

listener port mapping: 1521 on host




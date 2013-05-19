#Vagrant/Puppet Template for an Intershop 7 VM
This template will install a vm with
* Ubuntu 12.04
* Oracle XE 11g
* Intershop 7

## Prerequisites
You need to copy several files to the modules/*/files folder:

### oracle
It is important that the jars version matches the database version. If in doubt check the manifest in the jar.
* oracle-xe-11.2.0-1.0.x86_64.rpm.zip
* ojdbc6.jar
* ucp.jar

### intershop
* Extract the Intershop iso.
* Run rpmconv.sh to create the rpms for ES1.
* Convert the rpms to debs with "alien --scripts *.rpm".
* Copy all debs to files and the etest files from the optional files.

### dependencies for libapr1 1.4 (not in precise) 
Copy these packages from quantal to files
* libapr1_1.4.6-3_amd64.deb
* libaprutil1_1.4.1-3_amd64.deb
* libaprutil1-dbd-odbc_1.4.1-3_amd64.deb

## vagrant
Install vagrant with
* gem install vagrant
* gem install vagrant-vbguest
You also need Ruby for that.

## Setup
To create the vm run "vagrant up" inside the directory. Connect to the VM with "vagrant ssh".

## Status
* The Oracle XE installation is done. A user called intershop is created with all required tablespaces.
* The Intershop packages are installed, also the users are created.

## TODO
* Installing license.xml
* Running postinstallation script
* Changing owner and access rights
* Starting services

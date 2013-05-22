#Vagrant/Puppet Template for an Intershop 7 VM
This template will install a vm with
* Ubuntu 12.04
* Oracle XE 11g
* Intershop 7

## Prerequisites
You need to copy several files to the modules/*/files folder:

### oracle
* oracle-xe-11.2.0-1.0.x86_64.rpm.zip

### intershop
* Extract the Intershop iso.
* Run rpmconv.sh to create the rpms for ES1.
* Convert the rpms to debs with "alien --scripts *.rpm".
* Copy all debs to files/deb and the etest files from the optional files to files/deb/optional.
* Copy the license.xml file to the files folder.
* Copy ojdbc6.jar and ucp.jar. It is important that the jars version matches the database version. If in doubt check the manifest in the jar.

### dependencies for libapr1 1.4 (not in precise) 
Copy these packages from quantal to files
* libapr1_1.4.6-3_amd64.deb
* libaprutil1_1.4.1-3_amd64.deb
* libaprutil1-dbd-odbc_1.4.1-3_amd64.deb

## vagrant
Install vagrant with
* gem install vagrant
* gem install vagrant-vbguest

You also need Ruby and VirtualBox.

## Setup
To create the vm run "vagrant up" inside the directory. Connect to the VM with "vagrant ssh".

## Status
* An DB user intershop/intershop is created.
* The DB is automatically started.
* The AS with all base cartriges gets installed.
* The templates are precompiled.

## What you need to do / TODO
* Export IS_HOME directory to host.
* Change owner and access rights (install.txt in Intershop Studio)
* Set IS_SOURCE and IS_TARGET
* Adjust cartridgelist.properties
* Run dbinit/import dump
* Start AS and Webserver/WA
* To mount the eserver1 directory run mnt_eserver.sh.


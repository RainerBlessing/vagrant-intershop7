#!/bin/bash
. /eserver1/bin/environment.sh
chown -R isas1:isgrp1 $IS_SHARE/* 
cd $IS_SHARE
chmod g+rx system
chmod g+rX -R system/cartridges
chmod g+w system/cartridges/cartridgelist.properties
chmod g+rX -R system/config
chmod g+ws system/config/cartridges
cd $IS_HOME
chmod g+rX -R lib
chmod g+rx tools
chmod g+rX -R tools/ant
chmod g+rx tools/build
chmod g+rX -R tools/build/shared
chmod g+rx tools/misc
chmod g+r tools/misc/toolbox.jar
chmod g+rX -R /var/opt/intershop/eserver1/tomcat
chmod g+rX -R $IS_HOME/engine/servletEngine
chmod g+w -R $IS_HOME/engine/servletEngine/pagecompile
chmod g+rX -R $IS_HOME/engine/tomcat
chmod g+w -R $IS_HOME/engine/tomcat/servers/appserver0/logs
chmod g+w -R $IS_HOME/engine/tomcat/servers/appserver0/work
chmod g+rX -R $IS_SHARE/system/servletEngine
chmod g+rX -R $IS_SHARE/system/tcm
chmod g+rX -R $IS_SHARE/system/log
chmod g+w $IS_SHARE/system/log/*appserver0.log
chmod g+wrx $IS_SHARE/sites

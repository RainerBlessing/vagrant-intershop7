class system::base {

  exec { "apt-update":
      command => "/usr/bin/apt-get -y update",
      unless => "/usr/bin/test -f /etc/default/oracle-xe",
      timeout => 3600;
  }
}

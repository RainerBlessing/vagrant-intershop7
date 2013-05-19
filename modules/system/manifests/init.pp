class system::base {

  exec { "apt-update":
      command => "/usr/bin/apt-get -y update",
      timeout => 3600;
  }
}

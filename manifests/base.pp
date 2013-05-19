node intershop72 {
  include system::base
  include oracle::server
  include oracle::swap
  include oracle::xe
  include oracle::intershop
  include intershop::base
  include intershop::optional
  include intershop::postinstall
  user { "vagrant":
    groups => "dba",
    # So that we let Oracle installer create the group
    require => Service["oracle-xe"],
  }
}

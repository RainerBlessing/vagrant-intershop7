class intershop::user {

  Exec { path => '/bin:/usr/sbin' }
  define intershop::set_password($user=$title) {
    $password='$6$ES5FnGUo$oPHLgVH9vT3uZAF0buVMaX4hhoEfQZZi.tswCa/Kf5oSwwwU0ksltf4W/xmRftVDEqw8seey1uydPHgzwCtHW1'
    exec {
      "usermod -p '${password}' ${user}":
        onlyif => "egrep -q '^${user}:!:' /etc/shadow",
               require => User[$user];
    }
  }

  User {
      ensure => present,
      require => Group["isgrp1"],
      shell => "/bin/bash",
      home => "/opt/intershop/eserver1",
      groups => ["isgrp1"],
  }

  user {
    "isas1":
      uid => 3200;
    "iswa1":
      uid => 3201;
  }

  
  group {
    "isgrp1":
      gid => 3200,
      ensure => present;
  }

  intershop::set_password{ 'isas1': }
  intershop::set_password{ 'iswa1': }

}
class intershop::base {

  $apt_get = ["libssl0.9.8","libasound2","libxi6","libxrender1","libxtst6","libc6-i386"]
  package {
    $apt_get:
    require => Exec["apt-update"],
    ensure => installed;
  }

  $intershop_version="7.2.1.0-137"
  $package_dir="/tmp/vagrant-puppet/modules-0/intershop/files/deb"

package {
  "intershop-es1-sfs-ac-ruleengine-drools-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-ruleengine-drools-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-ch-b2c-rest-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-ch-b2c-rest-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-ase-loaderapp-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-ase-loaderapp-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-configuration-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-configuration-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-ase-toolbox-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-ase-toolbox-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-ase-runtime-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-ase-runtime-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-ase-tool-dbinit-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-ase-tool-dbinit-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-addresscheck-std-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-addresscheck-std-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-wishlist-orm-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-wishlist-orm-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-smc-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-smc-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-ecircle-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-ecircle-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-config-merger-config-merger-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-config-merger-config-merger-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-btc-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-btc-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-captcha-simplecaptcha-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-captcha-simplecaptcha-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-ase-tcm-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-ase-tcm-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-payment-std-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-payment-std-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-service-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-service-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-image-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-image-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-wsrp-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-wsrp-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-businessobject-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-businessobject-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-servletengine-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-servletengine-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-enterprise-app-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-enterprise-app-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-application-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-application-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-giftcard-std-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-giftcard-std-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-customer-orm-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-customer-orm-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-auditing-orm-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-auditing-orm-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-pf-extension-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-pf-extension-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-cxml-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-cxml-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-oci-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-oci-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-jdk-3rd-jdk-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-jdk-3rd-jdk-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-captcha-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-captcha-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-ch-b2c-app-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-ch-b2c-app-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-tendering-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-tendering-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-wa-webadapter-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-wa-webadapter-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-addresscheck-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-addresscheck-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-order-export-xml-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-order-export-xml-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-rating-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-rating-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-product-configuration-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-product-configuration-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-pmc-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-pmc-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-preview-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-preview-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-tcm-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-tcm-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-giftcard-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-giftcard-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-jmx-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-jmx-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-xcs-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-xcs-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-ch-b2c-image-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-ch-b2c-image-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-spreadsheet-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-spreadsheet-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-ch-b2c-cm-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-ch-b2c-cm-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-orm-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-orm-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-ase-setup-framework-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-ase-setup-framework-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-marketing-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-marketing-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-tomcat-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-tomcat-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-ase-toolbox-doc":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-ase-toolbox-doc_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-customer-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-customer-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-ch-sf-base-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-ch-sf-base-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-cdn-akamai-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-cdn-akamai-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-messaging-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-messaging-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-report-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-report-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-pmc-validation-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-pmc-validation-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-httpd-3rd-apache-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-httpd-3rd-apache-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-captcha-recaptcha-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-captcha-recaptcha-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-profanitycheck-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-profanitycheck-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-preview-orm-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-preview-orm-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-tools-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-tools-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-pricing-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-pricing-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-promotion-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-promotion-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-region-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-region-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-organization-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-organization-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-repository-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-repository-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-requisition-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-requisition-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-order-status-import-xml-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-order-status-import-xml-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-core-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-core-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-preview-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-preview-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-auditing-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-auditing-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-product-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-product-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-catalog-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-catalog-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-mail-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-mail-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-pf-objectgraph-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-pf-objectgraph-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-order-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-order-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-shipping-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-shipping-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-emf-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-emf-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-base-runtime-env":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-base-runtime-env_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-pmc-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-pmc-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-warranty-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-warranty-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-i18n-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-i18n-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-ch-consumer-plugin-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-ch-consumer-plugin-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-ch-base-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-ch-base-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-rest-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-rest-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bts-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bts-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-approval-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-approval-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-ant-ant-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-ant-ant-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-product-rating-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-product-rating-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-ase-monitor-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-ase-monitor-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-migration-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-migration-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-giftpackaging-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-giftpackaging-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-search-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-search-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-ruleengine-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-ruleengine-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-mail-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-mail-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-order-impex-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-order-impex-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-rating-orm-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-rating-orm-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-mvc-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-mvc-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-ase-setup-framework-doc":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-ase-setup-framework-doc_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-product-rating-orm-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-product-rating-orm-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-productbinding-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-productbinding-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-pf-objectgraph-guice-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-pf-objectgraph-guice-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-cache-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-cache-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-calculation-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-calculation-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-pf-cartridge-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-pf-cartridge-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ui-web-library-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ui-web-library-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-mcm-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-mcm-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-address-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-address-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-app-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-app-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-monitor-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-monitor-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-validation-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-validation-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-system-app-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-system-app-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-component-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-component-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-basket-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-basket-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-pipeline-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-pipeline-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-shipping-data-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-shipping-data-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-wishlist-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-wishlist-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-file-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-file-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-isml-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-isml-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-ac-bmecat-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-ac-bmecat-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-bc-foundation-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-bc-foundation-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-loaderapp-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-loaderapp-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-ch-b2c-base-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-ch-b2c-base-share_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-tomcat-3rd-tomcat-local":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-tomcat-3rd-tomcat-local_7.2.1.0-137_amd64.deb";
}
package {
  "intershop-es1-sfs-sld-ch-partner-plugin-share":
    require => [User["isas1"],User["iswa1"],Package[$apt_get]],
    provider => "dpkg",
    ensure => present,
    source => "intershop-es1-sfs-sld-ch-partner-plugin-share_7.2.1.0-137_amd64.deb";
}

}

class intershop::duplicates{
  $dpkg_force_overwrite = "/usr/bin/dpkg -i --force-confdef --force-overwrite"

  #exec can not handle arrays, fixed in puppet 3.2.0
  #$packages_with_duplicates = [
  #  "${dpkg_force_overwrite} ${package_dir}/intershop-es1-sfs-bc-marketing-share_${intershop_version}_amd64.deb",
  #  "${dpkg_force_overwrite} ${package_dir}/intershop-es1-sfs-orm-share_${intershop_version}_amd64.deb",
  #  "${dpkg_force_overwrite} ${package_dir}/intershop-es1-sfs-core-share_${intershop_version}_amd64.deb",
  #]

 exec{
    "install_packages_with_duplicates_1":
      require => Package["intershop-base"],
      unless => "/usr/bin/test -f /var/opt/intershop/eserver1/log/postinstall.log",
      command => "${dpkg_force_overwrite} ${package_dir}/intershop-es1-sfs-bc-marketing-share_${intershop_version}_amd64.deb";
 }
 exec{
    "install_packages_with_duplicates_2":
      require => Exec["install_packages_with_duplicates_1"],
      unless => "/usr/bin/test -f /var/opt/intershop/eserver1/log/postinstall.log",
      command => "${dpkg_force_overwrite} ${package_dir}/intershop-es1-sfs-orm-share_${intershop_version}_amd64.deb";
 }
 exec{
    "install_packages_with_duplicates_3":
      require => Exec["install_packages_with_duplicates_2"],
      unless => "/usr/bin/test -f /var/opt/intershop/eserver1/log/postinstall.log",
      command => "${dpkg_force_overwrite} ${package_dir}/intershop-es1-sfs-core-share_${intershop_version}_amd64.deb";
 }


}
class intershop::optional {

  $intershop_version="7.2.1.0-137"
  $package_dir="/tmp/vagrant-puppet/modules-0/intershop/files/deb/optional"

#  $intershop_optional_source = [
#  #"${package_dir}/intershop-es1-doc-etest-doc_${intershop_version}_amd64.deb",
#   # "${package_dir}/intershop-es1-sfs-etest-share_${intershop_version}_amd64.deb",
#    "${package_dir}/intershop-es1-demo-ucm-demo-share_${intershop_version}_amd64.deb",
#    "${package_dir}/intershop-es1-demo-ucm-demo-solr-share_${intershop_version}_amd64.deb",
#    "${package_dir}/intershop-es1-demo-ucm-misc-sfs-demo_${intershop_version}_amd64.deb",
#  ]
#
#  package {
#    "intershop-optional":
#       require => Class['intershop::base'],
#       provider => "dpkg",
#       ensure => "present",
#       source => $intershop_optional_source;
#  }
}

class intershop::postinstall {  
  $is_home="/eserver1"
  $is_share="${is_home}/share"
  $is_etc="/etc/opt/intershop/eserver1"

  File {
     mode => 0660,
     owner => isas1,
     group => isgrp1,
     require => Class['intershop::base']
  }

  file {
    "${is_share}/system/cartridges/tools/release/lib/ojdbc6.jar":
      source => "puppet:///modules/intershop/ojdbc6.jar";
    "${is_share}/system/cartridges/tools/release/lib/ucp.jar":
      source => "puppet:///modules/intershop/ucp.jar";
    "${is_share}/system/license":
      ensure => directory;
    "${is_share}/system/license/license.xml":
      require => File["${is_share}/system/license"],
      source => "puppet:///modules/intershop/license.xml";
    "${is_etc}/postinstall.properties.vm":
      source => "puppet:///modules/intershop/postinstall.properties";
    "${is_share}/system/cartridges/cartridgelist.properties":
      source => "puppet:///modules/intershop/cartridgelist.properties";
    "${is_share}/sites":
      ensure => directory;
    "${is_share}/system/config/servers":
      ensure => directory;
    "${is_share}/system/config/servers/127.0.1.1":
      require => File["${is_share}/system/config/servers"],
      ensure => directory;
    "${is_share}/system/config/servers/127.0.1.1/ES1":
      require => File["${is_share}/system/config/servers/127.0.1.1"],
      ensure => directory;
  }

  exec{
    "postinstall.pl":
      require => [Class['intershop::base'],File["${is_etc}/postinstall.properties.vm"],File["${is_share}/system/config/servers/127.0.1.1/ES1"]],
      command => "${is_home}/bin/postinstall.pl ${is_etc}/postinstall.properties.vm",
      #creates => "/var/opt/intershop/eserver1/log/postinstall.log",
  }

  exec{
    "dbinit":
      require => Exec["postinstall.pl"],
      command => "${is_home}/bin/dbinit.sh -classic",
      creates => "${is_share}/system/log/dbinit-sql",
      timeout => 2400;
  }

  exec{
    "ant precompile":
      require => [Exec["dbinit"], File["${is_share}/sites"]],
      command => "${is_home}/tools/ant/bin/ant -f ${is_home}/tools/misc/build.xml precompile",
      creates => "${is_share}/system/cartridges/xcs/release/pagecompile",
      timeout => 1200;
  }

  exec{
    "rights":
      require => Exec["ant precompile"],
      command => "/vagrant/modules/intershop/files/rights.sh",
      unless => "/usr/bin/test $(stat -c %a src) -eq 770",
  }

}

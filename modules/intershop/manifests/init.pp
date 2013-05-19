
class intershop::base {

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

  #$apt_get = ["libaprutil1-dbd-odbc","libssl0.9.8","libasound2","libxi6","libxrender1","libxtst6","libc6-i386"]
  $apt_get = ["libssl0.9.8","libasound2","libxi6","libxrender1","libxtst6","libc6-i386"]
  package {
      $apt_get:
      require => Exec["apt-update"],
      ensure => installed;
  }

  $intershop_version="7.2.1.0-137"
  $package_dir="/tmp/vagrant-puppet/modules-0/intershop/files"

  $intershop_base_source = [
  "${package_dir}/libapr1_1.4.6-3_amd64.deb",
    "${package_dir}/libaprutil1-dbd-odbc_1.4.1-3_amd64.deb",
    "${package_dir}/libaprutil1_1.4.1-3_amd64.deb",
    "${package_dir}/intershop-es1-ant-ant-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-ase-loaderapp-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-ase-monitor-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-ase-runtime-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-ase-setup-framework-doc_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-ase-setup-framework-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-ase-tcm-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-ase-toolbox-doc_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-ase-toolbox-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-ase-tool-dbinit-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-base-runtime-env_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-config-merger-config-merger-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-httpd-3rd-apache-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-jdk-3rd-jdk-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-addresscheck-std-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-bmecat-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-captcha-recaptcha-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-captcha-simplecaptcha-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-cdn-akamai-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-cxml-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-ecircle-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-giftcard-std-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-mail-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-oci-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-order-export-xml-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-order-status-import-xml-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-payment-std-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ac-ruleengine-drools-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-app-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-addresscheck-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-address-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-application-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-approval-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-auditing-orm-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-auditing-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-basket-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-calculation-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-captcha-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-catalog-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-customer-orm-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-customer-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-foundation-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-giftcard-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-giftpackaging-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-i18n-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-image-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-mail-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-marketing-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-mvc-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-order-impex-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-order-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-organization-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-pmc-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-pmc-validation-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-preview-orm-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-preview-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-pricing-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-productbinding-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-product-configuration-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-product-rating-orm-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-product-rating-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-product-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-profanitycheck-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-promotion-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-rating-orm-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-rating-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-region-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-repository-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-requisition-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-ruleengine-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-search-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-service-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-shipping-data-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-shipping-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-spreadsheet-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-tendering-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-validation-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-warranty-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-wishlist-orm-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bc-wishlist-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-btc-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-bts-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-businessobject-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-cache-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-component-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-configuration-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-emf-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-file-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-isml-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-jmx-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-loaderapp-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-messaging-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-migration-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-monitor-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-orm-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-pf-cartridge-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-pf-extension-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-pf-objectgraph-guice-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-pf-objectgraph-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-pipeline-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-report-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-rest-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-servletengine-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-ch-b2c-app-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-ch-b2c-base-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-ch-b2c-cm-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-ch-b2c-image-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-ch-b2c-rest-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-ch-base-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-ch-consumer-plugin-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-ch-partner-plugin-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-ch-sf-base-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-enterprise-app-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-mcm-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-pmc-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-preview-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-sld-system-app-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-smc-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-tcm-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-tomcat-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-tools-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-ui-web-library-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-wsrp-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-xcs-share_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-tomcat-3rd-tomcat-local_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-wa-webadapter-local_${intershop_version}_amd64.deb",
    ]

  package {
    "intershop-base":
      require => [User["isas1"],User["iswa1"],Package[$apt_get]],
      provider => "dpkg",
      ensure => latest,
      source => $intershop_base_source;
  }

  exec{
       "core":
         require => Package["intershop-base"],
       command => "/usr/bin/dpkg -i --force-overwrite ${package_dir}/intershop-es1-sfs-core-share_${intershop_version}_amd64.deb";
  }

}

class intershop::optional {

  $intershop_version="7.2.1.0-137"
  $package_dir="/tmp/vagrant-puppet/modules-0/intershop/files/optional"

  $intershop_optional_source = [
  "${package_dir}/intershop-es1-doc-etest-doc_${intershop_version}_amd64.deb",
    "${package_dir}/intershop-es1-sfs-etest-share_${intershop_version}_amd64.deb",
    ]

      package {
        "intershop-optional":
          require => [Package["intershop-base"]],
        provider => "dpkg",
        ensure => latest,
        source => $intershop_optional_source;
  }
}

class intershop::postinstall {
  $is_home="/eserver1"
  $is_share="${is_home}/share"
  $is_etc="/etc/opt/intershop/eserver1"

  File {
      mode => 0600,
      owner => isas1,
      require => Package["intershop-base"],
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
  }

  exec{
    "postinstall.pl":
      require => File["${is_etc}/postinstall.properties.vm"],
              command => "${is_home}/bin/postinstall.pl ${is_etc}/postinstall.properties.vm",
  }
}

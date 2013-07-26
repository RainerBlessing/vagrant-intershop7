require "fileutils"

class PuppetPackage
  attr_reader :name, :require, :provider, :ensure, :source
  @@base_package_dir='/tmp/vagrant-puppet/modules-0/'

  def initialize(file_path,relative_package_dir='',require_string='')
    file_name = File.basename(file_path) 
    @name=file_name.split("_")[0]
    @require=require_string
    @provider = "dpkg"
    @ensure = "present"
    @source = File.join(@@base_package_dir,relative_package_dir,file_name)
  end

  def to_s
  %Q[package {
  "#{@name}":
    require => #{@require},
    provider => "#{@provider}",
    ensure => #{@ensure},
    source => "#{@source}";
}]
  end
end

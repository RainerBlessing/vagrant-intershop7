require "fileutils"

class PuppetPackage
  attr_reader :name, :require, :provider, :ensure, :source

  def initialize(file_path,require_string)
    file_name = File.basename(file_path) 
    @name=file_name.split("_")[0]
    @require=require_string
    @provider = "dpkg"
    @ensure = "present"
    @source = file_name
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

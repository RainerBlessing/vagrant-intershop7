require "fileutils"
require "puppet_package"

class PuppetPackageCreator
  def initialize(root=File.join(File.dirname(__FILE__),"../"),require_string="")
    @root = root
    @require_string = require_string
  end

  def create(directory)
    packages = []
    file_pattern=File.join(@root,directory,"*.deb")
    Dir.glob(file_pattern).each do |deb_file|
      packages << PuppetPackage.new(deb_file, @require_string)
    end
    packages
  end

  def insert(manifest_path,package_sections)
    full_manifest_path =File.join(@root,manifest_path)
    File.read(full_manifest_path).gsub('INTERSHOP_PACKAGES',package_sections)
  end

  def write(manifest,manifest_path='modules/intershop/manifests/init.pp')
    full_manifest_path =File.join(@root,manifest_path)
    manifest_file = File.new(full_manifest_path,'w')
    manifest_file.write(manifest)
    manifest_file.close
  end
end

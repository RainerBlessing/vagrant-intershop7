require "fileutils"
require "puppet_package"

class PuppetPackageCreator
  def initialize(root=File.join(File.dirname(__FILE__),"../"))
    @root = root
  end

  def create(directory, relative_source_dir="",require_string="", filter=nil, negative_filter=nil)
    packages = []
    
    Dir.glob(create_file_pattern(directory, filter)).each do |deb_file|
      unless !negative_filter.nil? && deb_file.match(/#{negative_filter}/).size==1
        packages << PuppetPackage.new(deb_file, relative_source_dir, require_string)
      end
    end
    packages
  end

  def insert(manifest_path,package_sections)
    full_manifest_path =File.join(@root,manifest_path)
    manifest_file = File.read(full_manifest_path)
    package_sections.each do |packages_section|
      manifest_file.gsub!(packages_section.replacement_string,packages_section.string)
    end
    manifest_file
  end

  def write(manifest,manifest_path='modules/intershop/manifests/init.pp')
    full_manifest_path =File.join(@root,manifest_path)
    manifest_file = File.new(full_manifest_path,'w')
    manifest_file.write(manifest)
    manifest_file.close
  end

  private

  def  create_file_pattern directory, filter
    if filter.nil?
      file_pattern=File.join(@root,directory,"*.deb")
    else
      file_pattern=File.join(@root,directory,"*#{filter}*.deb")
    end
    file_pattern
  end
end

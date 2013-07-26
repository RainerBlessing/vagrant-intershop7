$:<< File.join(File.dirname(__FILE__), 'lib')
require 'file_checker'
require 'iso_mounter'
require 'package_converter'
require 'puppet_package_creator'
require 'packages_sections'

@root = File.join(File.dirname(__FILE__), 'installation')

task :default => [:create_debs] do
    puts "Done!"
end

task :check_files do
  fc = FileChecker.new(File.join(@root))
  raise 'Files are missing' unless fc.ok?
  raise 'Tools are missing' unless fc.available? %w[ fakeroot alien fuseiso ]
end

task :mount_iso do
   ih = ISOMounter.new(@root)
   ih.mount('iso/i72_linux.iso')
end

task :unmount_iso do
   ih = ISOMounter.new(@root)
   ih.unmount
end

task :create_debs => [ :check_files, :mount_iso ] do
   pc = PackageConverter.new(@root)
   pc.create_debs("mount/setup/server/ES1","packages")
   pc.create_debs("mount/setup/server/ES1/optional","packages/optional")
   Rake::Task["unmount_iso"].execute
end

task :update_package_section => [ :create_debs ] do
    @ppc = PuppetPackageCreator.new(@root)

    base_package_sections = @ppc.create('packages','/intershop/files/deb/','[User["isas1"],User["iswa1"],Package[$apt_get]]')
    optional_package_sections = @ppc.create('packages/optional','/intershop/files/deb/optional','[Class["intershop::base"]]','sfs')

    packages_sections = [
      PackagesSections.new('INTERSHOP_PACKAGES',base_package_sections),
      PackagesSections.new('INTERSHOP_OPTIONAL_PACKAGES',optional_package_sections)
    ]
    
    manifest_with_package_sections = @ppc.insert('modules/intershop/manifests/init.pp.tmp',packages_sections)

    @ppc.write(manifest_with_package_sections)
end

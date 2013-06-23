$:<< File.join(File.dirname(__FILE__), 'lib')
require 'file_checker'
require 'iso_mounter'
require 'package_converter'

task :default => [:create_debs] do
    puts "Done!"
end

task :check_files do
  fc = FileChecker.new(File.join(File.dirname(__FILE__), 'installation'))
  raise 'Files are missing' unless fc.ok?
  raise 'Tools are missing' unless fc.available? %w[ fakeroot alien fuseiso ]
end

task :mount_iso do
   ih = ISOMounter.new(File.join(File.dirname(__FILE__), 'installation'))
   ih.mount('iso/i72_linux.iso')
end

task :unmount_iso do
   ih = ISOMounter.new(File.join(File.dirname(__FILE__), 'installation'))
   ih.unmount
end

task :create_debs => [ :check_files, :mount_iso ] do
   pc = PackageConverter.new(File.join(File.dirname(__FILE__), 'installation'))
   pc.create_debs("mount/setup/server/ES1","packages")
   pc.create_debs("mount/setup/server/ES1/optional","packages/optional")
   Rake::Task["unmount_iso"].execute
end

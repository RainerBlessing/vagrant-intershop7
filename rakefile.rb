$:<< File.join(File.dirname(__FILE__), 'lib')
require 'file_checker'

task :default => [:check_files] do
    puts "Hello World!"
end

task :check_files do
  fc = FileChecker.new(File.join(File.dirname(__FILE__), 'installation'))
  raise 'Files are missing' unless fc.ok?
end

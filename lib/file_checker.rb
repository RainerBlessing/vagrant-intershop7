require 'yaml'

class FileChecker
  def initialize(root=File.join(File.dirname(__FILE__),"../"))
    @root = root
    required_files = YAML.load_file(File.join(@root,'required_files.yml'))
    @file_paths = required_files
  end

  def ok?(file_paths=@file_paths)
    status = false
    missing_files = []
    if File.directory?(@root)
      file_paths.each do |file_path|
        file_path_with_root = File.join(@root,file_path)
        if contains_wildcard(file_path)
          status = file_with_wildcard_exists file_path_with_root
        else
          status = File.exists?(file_path_with_root)
        end
        unless status
          missing_files << file_path
        end 
      end
    end
    puts missing_files
    missing_files.empty?
  end

  def file_with_wildcard_exists file_path
    Dir.glob(file_path).size == 1
  end

  def contains_wildcard file_path
    (/\*/ =~ file_path) != nil
  end

  def available? filenames
    filenames.each do |filename|
      if which(filename).nil?
        puts "Command '#{filename}' is missing."
        return false
      end
    end
    return true
  end

  # Cross-platform way of finding an executable in the $PATH.
  #
  #   which('ruby') #=> /usr/bin/ruby
  def which(cmd)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
      exts.each { |ext|
        exe = File.join(path, "#{cmd}#{ext}")
        return exe if File.executable? exe
      }
    end
    return nil
  end
end

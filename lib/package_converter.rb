require "fileutils"

class PackageConverter
  def initialize(root=File.join(File.dirname(__FILE__),"../"))
    @root = root
  end

  def create_debs(directory,dest_dir=directory)
    full_src_directory=File.join(@root,directory)
    full_dest_directory=File.join(@root,dest_dir)
    rpms = File.join(full_src_directory,"*.rpm")
    debs = File.join(full_dest_directory,"*.deb")
    delete debs
    system("cd #{full_dest_directory} && fakeroot alien --scripts #{rpms}")
  end

  private

  def delete(filepattern)
    Dir[filepattern].each do |file|
      FileUtils.rm_rf file
    end
  end
end

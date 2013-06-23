require 'fileutils'

class ISOMounter
  def initialize(root=File.join(File.dirname(__FILE__),"../"))
    @root = root
    @mount_dir = File.join(@root,'mount')
  end

  def mount(iso_path)
    full_iso_path = File.join(@root,iso_path)
    FileUtils.mkdir @mount_dir unless File.directory? @mount_dir
    %x( fuseiso #{full_iso_path} #{@mount_dir} )
  end

  def unmount
    %x( fusermount -z -u #{@mount_dir} )
  end
end

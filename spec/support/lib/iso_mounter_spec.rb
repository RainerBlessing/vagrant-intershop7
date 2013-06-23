require "iso_mounter"

describe "ISOMounter" do
  let(:root) { File.join(File.dirname(__FILE__),"../../../installation") }

  before(:each) do
    @ih = ISOMounter.new(root)
  end
  it "mounts the iso file" do
    @ih.mount('iso/i72_linux.iso')
    test_file = File.join(root, 'mount/index.html')
    expect(File.exists?(test_file)).to eq(true)
  end

  it "unmounts the iso" do
    @ih.unmount
    test_file = File.join(root, 'mount/index.html')
    expect(File.exists?(test_file)).to eq(false)
  end
end

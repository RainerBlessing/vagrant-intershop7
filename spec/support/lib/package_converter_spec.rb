require "package_converter"

describe "PackageConverter" do
  let(:root) { File.join(File.dirname(__FILE__),"../../../test_data") }
  
  before(:each) do
    @pc = PackageConverter.new(root)
  end

  it "converts rpm to deb" do
    @pc.create_debs('mount','packages')
    test_file = File.join(root, 'packages/empty-package_0-1_amd64.deb')
    expect(File.exists?(test_file)).to eq(true)
  end
end

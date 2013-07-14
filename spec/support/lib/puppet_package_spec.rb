require 'puppet_package_creator'

describe "PuppetPackage" do
  let(:root) { File.join(File.dirname(__FILE__),"../../../test_data") }
  
  before(:each) do
    @ppc = PuppetPackageCreator.new(root,'[User["isas1"],User["iswa1"],Package[$apt_get]]')
  end

  it "creates a package section" do
    package_sections = @ppc.create('packages')
    test_file = File.join(root, 'packages/empty-package_0-1_amd64.deb')

    package = package_sections[0]
    
    expect(package.name).to eq("empty-package")

    expect(package.require).to eq('[User["isas1"],User["iswa1"],Package[$apt_get]]')
    expect(package.provider).to eq("dpkg")
    expect(package.ensure).to eq("present")
    expect(package.source).to eq("empty-package_0-1_amd64.deb")
  end

  it "replaces the package section in the template" do
    package_sections = 'package_sections'
    manifest_with_package_sections = @ppc.insert('modules/intershop/manifests/init.pp.tmp',package_sections)

    expect(manifest_with_package_sections).to match(/package_sections/)
    expect(manifest_with_package_sections).not_to match(/INTERSHOP_PACKAGES/)
  end

  it "saves the manifest" do
    time = Time.now.getutc
    @ppc.write(time)
    expect(File.read(File.join(root,manifest_path))).to eq(time.to_s)
  end

end

require "file_checker"

describe "FileChecker" do
  before(:each) do
    root = File.join(File.dirname(__FILE__),"../../../test_data")
    @fc = FileChecker.new(root)
  end
  it "checks the presence of files neccessary to start the installation" do
    file_paths = ["iso/*.iso"]
    expect(@fc.ok?(file_paths)).to eq(true)
  end

  it "reads the files from a yml file" do
    expect(@fc.ok?).to eq(true)
  end

  it "tests for tools" do
    tools = %w[ alien fuseiso ]
    expect(@fc.available?(tools)).to eq(true)

    tools = %w[ alien2 fuseiso2 ]
    expect(@fc.available?(tools)).to eq(false)
  end
end

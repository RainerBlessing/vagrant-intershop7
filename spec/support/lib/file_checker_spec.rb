require "file_checker"

describe "FileChecker" do
  it "checks the presence of files neccessary to start the installation" do
    file_paths = ["iso/*.iso"]
    root = File.join(File.dirname(__FILE__),"../../../test_data")
 
    fc = FileChecker.new(root)
    expect(fc.ok?(file_paths)).to eq(true)
  end

  it "reads the files from a yml file" do
    root = File.join(File.dirname(__FILE__),"../../../test_data")
 
    fc = FileChecker.new(root)
    expect(fc.ok?).to eq(true)
  end
end

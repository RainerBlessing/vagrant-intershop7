require 'spec_helper'

describe "packages:default" do
  include_context "rake"

  it "mounts an iso image" do
    subject.invoke
  end
end

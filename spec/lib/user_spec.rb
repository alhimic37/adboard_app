require "spec_helper"
require "lib/user"

describe User do
  it "is name Arch" do
    user = User.new
    user.name.should == "Arch"
  end
  
  it "has age" do
    user = User.new
    #pending or xit
    user.age.should == 24
    user.should be_man
  end
end
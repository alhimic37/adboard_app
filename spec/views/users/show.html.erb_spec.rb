require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :login => "Login",
      :full_name => "Full Name",
      :email => "Email",
      :address => "Address",
      :city => "City",
      :state => "State",
      :country => "Country",
      :zip => "",
      :password => "Password",
      :confirm_password => "Confirm Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Login/)
    rendered.should match(/Full Name/)
    rendered.should match(/Email/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Country/)
    rendered.should match(//)
    rendered.should match(/Password/)
    rendered.should match(/Confirm Password/)
  end
end

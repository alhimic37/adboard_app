require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
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
      ),
      stub_model(User,
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
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Confirm Password".to_s, :count => 2
  end
end

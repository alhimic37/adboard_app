require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :login => "MyString",
      :full_name => "MyString",
      :email => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :zip => "",
      :password => "MyString",
      :confirm_password => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_login[name=?]", "user[login]"
      assert_select "input#user_full_name[name=?]", "user[full_name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_address[name=?]", "user[address]"
      assert_select "input#user_city[name=?]", "user[city]"
      assert_select "input#user_state[name=?]", "user[state]"
      assert_select "input#user_country[name=?]", "user[country]"
      assert_select "input#user_zip[name=?]", "user[zip]"
      assert_select "input#user_password[name=?]", "user[password]"
      assert_select "input#user_confirm_password[name=?]", "user[confirm_password]"
    end
  end
end

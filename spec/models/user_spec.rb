require 'spec_helper'

describe User do
  let!(:user) { User.new(login: "login", email: "jeka@nextmail.ru", password: "password", password_confirmation: "password") }
  subject {user}
  
  it { should be_valid }
  
  it { should respond_to(:login) }
  it { should respond_to(:full_name) }
  it { should respond_to(:birth_day) }
  it { should respond_to(:email) }
  it { should respond_to(:address) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:country) }
  it { should respond_to(:zip) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  describe "when login is not present" do
    before { user.login = " " }
    it { should_not be_valid }
  end

  describe "when login is too short" do
    before { user.login = "a" }
    it { should_not be_valid }
  end

  describe "when login is too long" do
    before { user.login = "a" * 21 }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { user.email = "" }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com, foo@bar..com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com a_us-er@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = user.dup
      user_with_same_email.email = user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
    after { User.delete_all }
  end

  describe "when password is not present" do
    subject { user = User.new(login: "login", email: "jeka@nextmail.ru")}
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before do
      user.password_confirmation = "mismatch" 
    end
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { user.password = user.password_confirmation = "a" * 5 }
    it { should_not be_valid }
  end
  
end

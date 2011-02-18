require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = {:name => "Tom",
             :email => "foo@bar.com",
             :password => "foobar",
             :password_confirmation => "foobar"
            }
  end
  
  #pending "add some examples to (or delete) #{__FILE__}"
  it "should create a new instance if given a valid attribute" do
    User.create!(@attr )
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => "", ) )
    no_name_user.should_not be_valid #calls user.valid?
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => "", ) )
    no_email_user.should_not be_valid 
  end
  
  it "should reject names that are too long" do
    long_name = 'x' * 51
    long_user = User.new(@attr.merge(:name => long_name,) )
    long_user.should_not be_valid 
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address, ))
      valid_email_user.should be_valid
    end
  end

  it "should not accept invalid email addresses" do
    addresses = %w[user@foo,com THE_USER_at_foo.bar.org last@foo.]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address, ))
      valid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email_address = User.new(@attr)
    user_with_duplicate_email_address.should_not be_valid
  end
  
  it "should reject addresses that differ only in case" do
    User.create!(@attr)
    user_with_duplicate_email_address = User.new(@attr)
    user_with_duplicate_email_address.email = @attr[:email].upcase
    user_with_duplicate_email_address.should_not be_valid
  end
  
  describe "passwords" do
    
    before(:each) do
      @user = User.new(@attr)
    end
    
    it "should have a password attribute" do
      @user.should respond_to(:password)
    end
    
    it "should have a password confirmation" do
      @user.should respond_to(:password_confirmation)
      
    end
  end
  describe "password validations" do
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => ""  )).
        should_not be_valid
    end
    it "should require a matching password validation" do
      User.new(@attr.merge(:password_confirmation => "barfoo"  )).
        should_not be_valid
    end
    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short,:password_confirmation => short  )
      User.new(hash).should_not be_valid      
    end
    it "should reject long passwords" do
      long = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long  )
      User.new(hash).should_not be_valid      
    end
    
  end
  
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end
    it "should have an encrypted password" do
      @user.should respond_to(:encrypted_password)
    end
  end
end

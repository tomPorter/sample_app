# == Schema Information
# Schema version: 20110218033154
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

class User < ActiveRecord::Base
  attr_accessor :password
  ## This ensures that no other columns can be modified by users!
  attr_accessible :name, :email, :password, :password_confirmation
  validates :name, :presence => true,
                   :length   => { :maximum => 50 }
  validates :email, :presence => true, :email => true,
                    :uniqueness => {:case_sensitive => false, }
  validates :password, :presence => true, :confirmation => true,
                       :length   => { :within => 6..40 }
  
  ## Alternate regex based email validation, uses format test:
  #email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, :presence => true, 
  #                  :format => {:with => email_regex},
  #                  :uniqueness => {:case_sensitive => false, }
  
end

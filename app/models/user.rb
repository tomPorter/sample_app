# == Schema Information
# Schema version: 20110213183552
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  ## This ensures that no other columns can be modified by users!
  attr_accessible :name, :email
  validates :name, :presence => true,
                   :length   => { :maximum => 50 }
  validates :email, :presence => true, :email => true,
                    :uniqueness => {:case_sensitive => false, }
  
  ## Alternate regex based email validation, uses format test:
  #email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, :presence => true, 
  #                  :format => {:with => email_regex}
  
end

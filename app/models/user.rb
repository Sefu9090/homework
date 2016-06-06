class User < ActiveRecord::Base 
  has_secure_password
    has_many :name
  has_many :work

end








class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  
  has_secure_password
end

class User < ApplicationRecord
  has_many :articles, dependent: :destroy

	before_save { self.email = email.downcase }

  enum role: { user: 0, admin: 1 }

  validates_presence_of :first_name, :last_name, :email, :username
  validates_uniqueness_of :email, :username, on: :create, message: "must be unique"
  
  has_secure_password
end

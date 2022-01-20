# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  extend FriendlyId

  friendly_id :username, use: :slugged

  has_many :articles, dependent: :destroy
  has_many :categories

  before_save do
    self.email = email.downcase
    self.username = username.downcase
  end

  enum role: { user: 0, admin: 1 }

  validates :first_name, :last_name, :email, :username, presence: true, length: { minimum: 5 }
  validates :email, :username, uniqueness: true

  has_secure_password(:password, validations: true)
  validates :password, confirmation: true, length: { in: 5..20 }
end

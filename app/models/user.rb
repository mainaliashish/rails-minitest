# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  extend FriendlyId

  friendly_id :username, use: :slugged

  has_many :articles, dependent: :destroy
  has_many :categories

  before_save { self.email = email.downcase }

  enum role: { user: 0, admin: 1 }

  validates :first_name, :last_name, :email, :username, presence: true
  validates :email, :username, uniqueness: true

  has_secure_password(:password, validations: true)
  validates :password, confirmation: true
end

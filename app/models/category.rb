# frozen_string_literal: true

# Category Model
class Category < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_many :article_categories
  has_many :articles, through: :article_categories
  belongs_to :user, optional: true

  validates :name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 30 }
end

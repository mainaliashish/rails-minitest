# frozen_string_literal: true

# Category Model
class Category < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_many :article_categories
  has_many :articles, through: :article_categories
  belongs_to :user

  validates_presence_of :name, on: %i[create update], message: "can't be blank"
end

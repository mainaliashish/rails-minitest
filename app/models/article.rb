class Article < ApplicationRecord
  extend FriendlyId
  
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  
  validates :title, presence: true
  validates :body, presence: true
end

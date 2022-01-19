class Category < ApplicationRecord
  extend FriendlyId
  
  friendly_id :name, use: :slugged

  has_many :article_categories
  has_many :articles, through: :article_categories

end

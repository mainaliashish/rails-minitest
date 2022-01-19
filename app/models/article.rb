class Article < ApplicationRecord
  extend FriendlyId
  
  friendly_id :title, use: :slugged

  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true
end

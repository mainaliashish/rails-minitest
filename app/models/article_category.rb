# frozen_string_literal: true

# ArticleCategory Model for has_many through association
class ArticleCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category
end

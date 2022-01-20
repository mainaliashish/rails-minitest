# frozen_string_literal: true

# this will handle operations related to pages.
class PagesController < ApplicationController
  def index
    @articles = Article.all
  end

  def about; end

  def contact; end
end

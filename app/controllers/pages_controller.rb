class PagesController < ApplicationController
  def index
    # binding.pry
    @articles = Article.all
  end

  def about
  end

  def contact
  end
end

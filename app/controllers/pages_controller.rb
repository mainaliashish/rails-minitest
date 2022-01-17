class PagesController < ApplicationController
  def index
    @articles = Article.all
  end

  def about
  end

  def contact
  end
end

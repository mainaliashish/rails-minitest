class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]
  before_action :require_user, except: %i[index show]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @articles = Article.includes(:user).paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      ArticleMailer.with(article: @article).article_created.deliver_now
      flash[:info] = 'Article Was Successfully Created!'
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:info] = 'Article Was Updated Successfully!'
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = 'Article Was Deleted Successfully!'
    redirect_to articles_path, status: :ok
  end

  private

  def set_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, category_ids: [])
  end

  def require_same_user
    return if current_user == @article.user || current_user.admin?

    flash[:notice] = 'You can only perform operations on you articles.'
    redirect_to root_path
  end
end

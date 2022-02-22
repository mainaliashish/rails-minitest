class CategoriesController < ApplicationController
  
  before_action :set_category, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_admin, only: [:edit, :update, :destroy]

  def index
    @categories = Category.includes(:user).paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      flash[:info] = "Category Was Successfully Created!"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
    flash[:info] = "Category Was Updated Successfully!"
    redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:danger] = "Category Was Deleted Successfully!"
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !current_user.admin?
      flash[:notice] = "You can not perform this actions on categories."
      redirect_to root_path
    end
  end

end

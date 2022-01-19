class CategoriesController < ApplicationController
  
  before_action :set_category, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:index, :show]
  before_action :require_admin, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @category = Category.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_category
    @Category = Category.friendly.find(params[:id])
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

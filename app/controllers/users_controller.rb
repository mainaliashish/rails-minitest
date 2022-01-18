class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_admin, only: :destroy
  before_action :require_same_user, only: %i[ edit update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to blog #{@user.first_name}"
      redirect_to articles_path
    else
      render :new
    end
  end
  
  def edit
  end

  def update
		if @user.update(user_params)
		flash[:info] = "User Was Updated Successfully!"
		redirect_to user_path(@user)
		else
			render :edit
		end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User has been deleted successfully."
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :username, :password)
  end

  def require_admin
    if @user.admin?
      flash[:notice] = "Only admin can perform this action."
      redirect_to users_path
    end
  end

  def require_same_user
    if @user != current_user and !current_user.admin?
      flash[:notice] = "You can only update your own profile."
      redirect_to users_path
    end
  end
end

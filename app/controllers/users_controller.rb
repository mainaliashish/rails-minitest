class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ edit update destroy ]

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
      redirect_to user_path(@user)
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
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :username, :password)
  end

  def require_admin
    if @user.role != 'admin'
      flash[:notice] = "Only admin can perform this action."
      redirect_to root_path
    end
  end
end

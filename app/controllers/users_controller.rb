class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
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

  # PATCH/PUT /users/1 or /users/1.json
  def update
		if @user.update(user_params)
		flash[:info] = "User Was Updated Successfully!"
		redirect_to user_path(@user)
		else
			render :edit
		end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password)
    end
end

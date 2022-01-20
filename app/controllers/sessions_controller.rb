# frozen_string_literal: true

# this will handle operations related to users session management.
class SessionsController < ApplicationController
  before_action :set_user, only: %i[create]
  def new; end

  def create
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'You have successfully logged in.'
      redirect_to root_path
    else
      flash.now[:danger] = 'Error : There was something wrong with your login information.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out Successfully.'
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find_by(email: params[:email].downcase)
  end
end

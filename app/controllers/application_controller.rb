# frozen_string_literal: true

# base controller.
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    flash[:danger] = 'You must be logged in to perform that action.'
    redirect_to root_path unless logged_in?
  end
end

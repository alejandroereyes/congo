class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :current_user

  def current_user
    @current_user ||= User.find(params[:user_id]) if params[:user_id]
  end

  def authenticate_user!
    unless current_user
      flash[:alert] = "You must be logged in to do that."
      redirect_to login_path
    end
  end

  def is_an_admin?
    unless current_user.admin
      flash[:alert] = "Access Denied"
      redirect_to :back
    end
  end
end

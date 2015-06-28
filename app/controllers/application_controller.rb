class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user!
     if session[:user_id] == nil
      flash[:alert] = "You must be logged in to do that."
      return false
    end
    true
  end

  def current_user_an_admin?(user)
    if user[:admin]
      true
    else
      false
    end
  end

  helper_method :current_user_an_admin?

  def new_user
    @new_user = User.new
  end

  helper_method :new_user

  def get_cart
    if authenticate_user!
      @user_order = Order.find_by(user_id: session[:user_id], completed: false)
    else
      redirect_to root_path, notice: "Please log in"
    end
  end

  helper_method :get_cart
end

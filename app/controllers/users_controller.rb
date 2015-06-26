class UsersController < ApplicationController

  def index
    # user = User.find(session[:user_id])
    # if current_user_an_admin?(user)
      @users = User.all#.paginate(:page => params[:page], :per_page => 30)
    # end
  end

  def show
    authenticate_user!
    begin
      if current_user.id == session[:user_id]
        @user = User.find(session[:user_id])
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to :back, flash[:alert] = "Record not found"
    end
  end
end

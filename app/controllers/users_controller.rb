class UsersController < ApplicationController

  def index
    @users = User.all#.paginate(:page => params[:page], :per_page => 30)
  end
end
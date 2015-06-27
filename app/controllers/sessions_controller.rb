class SessionsController < ApplicationController

  def new
  end

  def create
begin
  user = User.find_by_email(params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    render: {user: user, msg: "your good"}
  end
#   if user.authenticate(params[:password])
#     session[:user_id] = user.id
#     redirect_to root_path, notice: "Welcome, #{user.name}"
#   else
#     flash[:alert] = "Password did not match records"
#     render :new
#   end
# rescue ActiveRecord::RecordNotFound => error
#   flash[:alert] = "Email did not match records"
#   render :new
# end
end

def destroy
  session[:user_id] = nil
  redirect_to root_path, notice: "Thank for stopping by!"
end
end

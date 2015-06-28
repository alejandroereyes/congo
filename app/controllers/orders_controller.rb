class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def cart
    if authenticate_user!
      @user_order = Order.find_by(user_id: session[:user_id], completed: false)
    else
      redirect_to root_path, notice: "Please log in"
    end
  end

  def create
     if authenticate_user!
      @order = Order.find_or_create_by(user_id: session[:user_id], completed: false)
      @order.save

      @order_item = OrderItem.find_or_create_by(order_id: @order.id, item_id: params[:item_id])
      @order_item[:quantity] += params[:quantity].to_i

      if @order_item.save
        redirect_to :back, notice: "#{@order_item.inspect}"
        # redirect_to root_path, notice: "Your item has been added to your cart"
      else
        render :new, flash[:alert] = "Item was not saved, make sure you're logged in"
      end
     else
       redirect_to root_path
     end
  end
end

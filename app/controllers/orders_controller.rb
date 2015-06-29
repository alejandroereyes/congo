class OrdersController < ApplicationController

  def index
    if authenticate_user!
      user = User.find(session[:user_id])
      if current_user_an_admin?(user)
        @orders = Order.all.paginate(:page => params[:page], :per_page => 15)
      else
        redirect_to :back, flash[:alert] = "Access Denied"
      end
    else
      redirect_to root_path, flast[:alert] = "Please log In"
    end
  end

  def show
    if authenticate_user!
      @order = Order.find(params[:id])
    else
      redirect_to root_path, alert: "Please log In"
    end
  end

  def cart
    if authenticate_user!
      @user_order = Order.find_by(user_id: session[:user_id], completed: false)
    else
      redirect_to root_path, notice: "Please log in"
    end
  end

  def checkout
    if authenticate_user!
      @user = User.find(session[:user_id])
      @user_order = Order.find_by(user_id: @user.id, completed: false)
      @items = @user_order.order_items
      @total_paid = @user_order.order_items.total_due(@user_order[:id])
      @user_order[:completed] = true
      if @user_order.save
        CheckoutCompleted.checkout_confirmation(@user, @user_order).deliver_now
        redirect_to root_path, notice: "Your order has been processed"
      else
        redirect_to :back, alert: "Error processing checkout"
      end
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
        redirect_to :back, notice: "This item has been added to your cart"
        # redirect_to root_path, notice: "Your item has been added to your cart"
      else
        render :new, flash[:alert] = "Item was not saved, make sure you're logged in"
      end
     else
       redirect_to root_path
     end
  end
end

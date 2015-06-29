class CheckoutCompleted < ApplicationMailer

  def checkout_confirmation(user, order)
    @user  = user
    @order = order
    @items = @order.order_items
    @total_paid = @order.order_items.total_due(@order[:id])


    mail to: user.email, subject: "Thank you for your purchase!"
  end
end
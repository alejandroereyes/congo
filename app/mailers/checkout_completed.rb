class CheckoutCompleted < ApplicationMailer

  def checkout_confirmation(user, order)
    @user  = user
    @order = order
    @items = @order.order_items.items
    @total = @order.order_items.total_due

    mail to: user.mail, subject: "Thank you for your purchase!"
  end
end
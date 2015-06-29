class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  def self.total_due(order_id)
    amount_due = 0
    items_from_table = OrderItem.select('*').where(order_id: order_id)
    items_from_table.each do|item|
      amount_due += (item.item.cost * item.quantity) if item.item
    end
    amount_due
  end
end

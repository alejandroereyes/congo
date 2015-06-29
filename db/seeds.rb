# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
 item_one =  Item.create(title: Faker::Commerce.product_name, cost: Array(1..100).sample, description: Faker::Lorem.paragraph(2),
              inventory: Array(100..1000).sample, img_url: ["http://www.saberforge.com/images/stories/virtuemart/product/9758.jpg", "http://www.atomicmoo.com/wp-content/uploads/2013/03/Etvideogamecover.jpg"].sample)
 item_two =  Item.create(title: Faker::Commerce.product_name, cost: Array(1..100).sample, description: Faker::Lorem.paragraph(2),
                         inventory: Array(100..1000).sample, img_url: ["http://allansnewtoysforchristmas.com/wp-content/uploads/2012/08/12.jpg","http://i.kinja-img.com/gawker-media/image/upload/s--l2G1Vj9p--/c_fit,fl_progressive,q_80,w_636/194ibbm3go1rqpng.png"].sample)

  user = User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: 'word',
                     password_confirmation: 'word', admin: [true, false].sample)

  order = Order.create(user_id: user[:id], completed: [true, false].sample)

  OrderItem.create(order_id: order.id, item_id: item_one.id, quantity: Array(1..5).sample)

  if user.name.match(/^[aeiou]/i)
    OrderItem.create(order_id: order.id, item_id: item_two.id, quantity: Array(1..5).sample)
  end
end

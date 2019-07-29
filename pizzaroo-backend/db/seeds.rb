# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
    User.create(
        name: Faker::Name.name,
        username: Faker::Name.name,
        password: "1234"
      )
end

5.times do
    Restaurant.create(
        :name => Faker::Company.name,
        :address => Faker::Address.street_address,
      )
end

50.times do
    dish = Dish.create(
        name: Faker::Food.ingredient,
        description: Faker::Food.description,
        price: Faker::Number.number(2),
        restaurant_id: Faker::Number.between(1, 5),
      )
end

5.times do
    order = Order.create(
        user_id: 1,
        # Faker::Number.between(1, 10),
        restaurant_id: Faker::Number.between(1, 5),
      )
end

5.times do
  order = OrderDish.create(
      order_id: Faker::Number.between(1, 5),
      dish_id: Faker::Number.between(1, 5),
      quantity: Faker::Number.between(1, 5),
    )
end



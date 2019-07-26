class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :order_dishes
  has_many :dishes, through: :order_dishes
end

class OrderDishSerializer < ActiveModel::Serializer
    attributes :id, :quantity, :order, :dish
  end
class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user, :restaurant, :dishes
end

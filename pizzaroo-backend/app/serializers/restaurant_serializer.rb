class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :dishes
end

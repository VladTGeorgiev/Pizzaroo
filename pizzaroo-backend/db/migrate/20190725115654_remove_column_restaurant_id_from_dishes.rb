class RemoveColumnRestaurantIdFromDishes < ActiveRecord::Migration[5.2]
  def change
    remove_column :dishes, :restaurant_id, :string
  end
end

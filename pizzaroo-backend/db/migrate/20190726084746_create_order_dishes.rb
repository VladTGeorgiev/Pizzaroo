class CreateOrderDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :order_dishes do |t|
      t.integer :quantity
      t.references :order, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end

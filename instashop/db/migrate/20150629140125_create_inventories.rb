class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.string :product_name
      t.integer :unit_price
      t.integer :selling_price
      t.integer :original_quantity
      t.integer :quantity_sold
      t.integer :quantity_left

      t.timestamps null: false
    end
  end
end

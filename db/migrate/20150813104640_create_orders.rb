class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.string :product_name
      t.decimal :selling_price
      t.integer :quantity_sold
      t.string :customer_name
      t.string :customer_add
      t.integer :customer_contact
      t.boolean :customer_payment

      t.timestamps null: false
    end
  end
end

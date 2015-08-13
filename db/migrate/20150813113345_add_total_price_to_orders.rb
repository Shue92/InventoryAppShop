class AddTotalPriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :total_price, :decimal
    add_column :orders, :customer_email, :string
  end
end

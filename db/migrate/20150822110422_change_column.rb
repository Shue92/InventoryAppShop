class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :orders, :customer_contact,  :string
  end
end

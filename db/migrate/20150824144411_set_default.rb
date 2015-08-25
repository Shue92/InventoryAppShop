class SetDefault < ActiveRecord::Migration
   
  def up
    change_column :users, :role_id, :integer, :default => 3
  end

end

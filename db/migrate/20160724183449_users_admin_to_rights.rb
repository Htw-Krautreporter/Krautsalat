class UsersAdminToRights < ActiveRecord::Migration
  def change
  	remove_column :users, :admin
  	add_column :users, :rights, :integer, null: false, default: 0
  end
end

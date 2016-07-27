class AddColumnsToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :imageUrl, :string
  	add_column :comments, :linkUrl, :string
  end
end

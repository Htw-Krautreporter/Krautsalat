class AddCloumnsToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :imageUrl, :string
  	add_column :posts, :linkUrl, :string
  	add_column :posts, :linkText, :string
  end
end

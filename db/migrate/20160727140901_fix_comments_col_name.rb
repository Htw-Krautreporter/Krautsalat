class FixCommentsColName < ActiveRecord::Migration
  def change
  	rename_column :comments, :imageUrl, :linkText
  end
end

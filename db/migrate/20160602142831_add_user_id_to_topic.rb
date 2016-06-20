class AddUserIdToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :username_id, :integer
  end
end

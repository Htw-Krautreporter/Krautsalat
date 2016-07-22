class AddColumnExpertiseToUser < ActiveRecord::Migration
  def change
  	add_column :users, :expertise, :string, default: ""
  end
end

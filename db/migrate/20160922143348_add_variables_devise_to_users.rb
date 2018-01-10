class AddVariablesDeviseToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :permission_level, :integer
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :avatar, :string
  end
end

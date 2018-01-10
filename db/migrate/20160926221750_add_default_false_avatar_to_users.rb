class AddDefaultFalseAvatarToUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :avatar
    add_column :users, :avatar, :string, default: nil
  end
end

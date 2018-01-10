class AddColumnStatusToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, :boolean, default: 1
  end
end

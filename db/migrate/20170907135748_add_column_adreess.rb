class AddColumnAdreess < ActiveRecord::Migration[5.0]
  def change
  	add_column :addresses, :actual, :boolean, default:true
  end
end

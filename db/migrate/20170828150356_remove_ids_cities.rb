class RemoveIdsCities < ActiveRecord::Migration[5.0]
  def change
  	  remove_column :employees, :country_id, :integer
  	  remove_column :employees, :State_id, :integer
  	  remove_column :employees, :city_id, :integer
  end
end

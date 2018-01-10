class RemoveCitiesFromAddress < ActiveRecord::Migration[5.0]
  def change
   remove_column :addresses, :cities_id, :integer
   
  end
end

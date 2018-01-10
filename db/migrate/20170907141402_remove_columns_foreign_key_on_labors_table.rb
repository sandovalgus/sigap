class RemoveColumnsForeignKeyOnLaborsTable < ActiveRecord::Migration[5.0]
  def change
	remove_column :labors, :department_id
	remove_column :labors, :direction_id
	remove_column :labors, :general_direction_id
	remove_column :labors, :department_id_id
	remove_column :labors, :direction_id_id
	remove_column :labors, :general_direction_id_id  	 
  end
end

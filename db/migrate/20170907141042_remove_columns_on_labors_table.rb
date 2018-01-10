class RemoveColumnsOnLaborsTable < ActiveRecord::Migration[5.0]
  def change
  	remove_foreign_key :labors, :department_id
  	#remove_index :labors, name: 'index_labors_on_department_id'
  	remove_foreign_key :labors, :direction_id
  	#remove_index :labors, name: 'index_labors_on_direction_id'
  	remove_foreign_key :labors, :general_direction_id
  	#remove_index :labors, name: 'index_labors_on_general_direction_id'

  	remove_foreign_key :labors, :department_id_id
  	remove_index :labors, name: 'index_labors_on_department_id_id'
  	remove_foreign_key :labors, :direction_id_id
  	remove_index :labors, name: 'index_labors_on_direction_id_id'
  	remove_foreign_key :labors, :general_direction_id_id
  	remove_index :labors, name: 'index_labors_on_general_direction_id_id'
  end
end

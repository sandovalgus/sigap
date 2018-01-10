class ModifyColumnsOnLaborsTable < ActiveRecord::Migration[5.0]
  def change
  	remove_foreign_key :labors, :department_id, if_exists: true
  	remove_index :labors, name: 'index_labors_on_department_id', if_exists: true
  	remove_foreign_key :labors, :direction_id, if_exists: true
  	remove_index :labors, name: 'index_labors_on_direction_id', if_exists: true
  	remove_foreign_key :labors, :general_direction_id, if_exists: true
  	remove_index :labors, name: 'index_labors_on_general_direction_id', if_exists: true

  	remove_foreign_key :labors, :department_id_id, if_exists: true
  	remove_index :labors, name: 'index_labors_on_department_id_id', if_exists: true
  	remove_foreign_key :labors, :direction_id_id, if_exists: true
  	remove_index :labors, name: 'index_labors_on_direction_id_id', if_exists: true
  	remove_foreign_key :labors, :general_direction_id_id, if_exists: true
  	remove_index :labors, name: 'index_labors_on_general_direction_id_id', if_exists: true

  	add_column :labors, :permanent_plant_pass, :boolean
  	add_column :labors, :adscribed, :boolean
  	add_column :labors, :departure_date_indefinite, :boolean
  	add_column :labors, :takeover, :string
  	add_column :labors, :takeover_date, :datetime
  	add_column :labors, :contracting_regime, :string
  	add_column :labors, :legal_instrument, :string
  	add_column :labors, :category, :integer
  end
end

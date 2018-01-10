class AddDefaultNilGeneralDirectionIdToDepartment < ActiveRecord::Migration[5.0]
  def change
  	remove_column :departments, :general_direction_id
  	add_reference :departments, :general_direction, foreign_key: true, default: nil
  end
end

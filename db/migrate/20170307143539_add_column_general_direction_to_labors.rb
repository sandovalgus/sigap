class AddColumnGeneralDirectionToLabors < ActiveRecord::Migration[5.0]
  def change
    #add_column :labors, :general_direction_id, :integer
    add_reference :labors, :general_direction, foreign_key: true
  end
end

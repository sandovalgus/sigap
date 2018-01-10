class AddGeneralDirectionIdToDepartment < ActiveRecord::Migration[5.0]
  def change
    add_reference :departments, :general_direction, foreign_key: true
  end
end

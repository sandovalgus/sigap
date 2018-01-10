class AddDirectionIdToLabors < ActiveRecord::Migration[5.0]
  def change
    add_reference :labors, :direction, foreign_key: true
    add_reference :labors, :department, foreign_key: true
    add_reference :labors, :function, foreign_key: true
  end
end

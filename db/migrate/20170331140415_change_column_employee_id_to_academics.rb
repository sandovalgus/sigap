class ChangeColumnEmployeeIdToAcademics < ActiveRecord::Migration[5.0]
  def change
  	remove_column :academics, :employees_id
  	add_reference :academics, :employee, foreign_key: true, index: true
  end
end

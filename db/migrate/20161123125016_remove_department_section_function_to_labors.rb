class RemoveDepartmentSectionFunctionToLabors < ActiveRecord::Migration[5.0]
  def change
  	remove_column :labors, :department
  	remove_column :labors, :section
  	remove_column :labors, :function
  end
end

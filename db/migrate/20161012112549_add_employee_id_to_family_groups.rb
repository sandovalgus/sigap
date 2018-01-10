class AddEmployeeIdToFamilyGroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :family_groups, :employee, index: true
    add_foreign_key :family_groups, :employees
  end
end

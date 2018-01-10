class RemoveColumnsFromEmployees < ActiveRecord::Migration[5.0]
  def change
    remove_column :employees, :neighborhood, :string
    remove_column :employees, :address_street, :string
    remove_column :employees, :address_number, :string
    remove_column :employees, :address_floor, :string
    remove_column :employees, :address_floor_apartment_number, :string
    remove_column :employees, :address_monoblock, :string
  end
end

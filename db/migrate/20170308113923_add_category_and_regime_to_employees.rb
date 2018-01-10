class AddCategoryAndRegimeToEmployees < ActiveRecord::Migration[5.0]
  def change
  	add_column :employees, :category, :string
  	add_column :employees, :regimen, :string
  end
end

class AddNationalityToEmployee < ActiveRecord::Migration[5.0]
  def change
  	add_column :employees, :nationality, :string
  end
end

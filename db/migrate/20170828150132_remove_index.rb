class RemoveIndex < ActiveRecord::Migration[5.0]
  def change
  	remove_index(:employee, :name => 'index_employees_on_State_id')
  	remove_index(:employee, :name => 'index_employees_on_city_id')
  	remove_index(:employee, :name => 'index_employees_on_country_id')

  end
end

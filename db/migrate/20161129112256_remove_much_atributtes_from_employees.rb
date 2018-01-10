class RemoveMuchAtributtesFromEmployees < ActiveRecord::Migration[5.0]
  def change
  	remove_column :employees, :category, :string
  	remove_column :employees, :function_employee, :string
  	remove_column :employees, :relationship_of_dependency, :string
  	remove_column :employees, :city, :string
  	remove_column :employees, :location, :string
  	remove_column :employees, :state, :string
  	remove_column :employees, :country, :string
  	remove_column :employees, :tel_emergency, :string
  	remove_column :employees, :name_contact, :string
  	remove_column :employees, :tel_work, :string
  	remove_column :employees, :interno_tel_work, :string
  	remove_column :employees, :email_work, :string
  	remove_column :employees, :name_social_work, :string
  	remove_column :employees, :number_partner, :string
  	remove_column :employees, :blood_type, :string
  	remove_column :employees, :allergies, :string
  	remove_column :employees, :background, :string
  	remove_column :employees, :leaving_date, :string
  	remove_column :employees, :reason, :string
  	remove_column :employees, :clinical_analyzes, :boolean

  end
end

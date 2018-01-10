class RemoveDateOfAdmissionFromEmployees < ActiveRecord::Migration[5.0]
  def change
  	  	remove_column :employees, :date_of_admission, :datetime
  end
end

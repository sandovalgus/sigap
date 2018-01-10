class RemoveColumnsToEmployee < ActiveRecord::Migration[5.0]
  def change
  	if column_exists?(:employees, :legal_instrument)
  		remove_column :employees, :legal_instrument, :string
  	end
  	if column_exists?(:employees, :neighborhood)
  		remove_column :employees, :neighborhood, :string
  	end
	if column_exists?(:employees, :address_street)
		remove_column :employees, :address_street, :string
	end
	if column_exists?(:employees, :address_number)
		remove_column :employees, :address_number, :string
	end
	if column_exists?(:employees, :address_floor)
		remove_column :employees, :address_floor, :string
	end
	if column_exists?(:employees, :address_floor_apartment_number)
		remove_column :employees, :address_floor_apartment_number, :string
	end
	if column_exists?(:employees, :address_monoblock)
		remove_column :employees, :address_monoblock, :string
	end
	if column_exists?(:employees, :making_performance)
		remove_column :employees, :making_performance, :string
	end
	if column_exists?(:employees, :suitable)
		remove_column :employees, :suitable, :string
	end
	if column_exists?(:employees, :copy_document)
		remove_column :employees, :copy_document, :string
	end
	if column_exists?(:employees, :country_id)
		remove_column :employees, :country_id, :string
	end
	if column_exists?(:employees, :State_id)
		remove_column :employees, :State_id, :string
	end
	if column_exists?(:employees, :city_id)
		remove_column :employees, :city_id, :string
	end
	if column_exists?(:employees, :category)
		remove_column :employees, :category, :string
	end
	if column_exists?(:employees, :regimen)
		remove_column :employees, :regimen, :string
	end

	add_column :employees, :date_of_admission, :datetime
  end
end

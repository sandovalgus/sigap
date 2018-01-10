class AddAgeToFamilyGroup < ActiveRecord::Migration[5.0]
  def change
  	add_column :family_groups, :age, :string
  end
end

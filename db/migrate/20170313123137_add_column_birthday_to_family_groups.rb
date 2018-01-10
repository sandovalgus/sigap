class AddColumnBirthdayToFamilyGroups < ActiveRecord::Migration[5.0]
  def change
  	add_column :family_groups, :Birthday, :datetime
  end
end

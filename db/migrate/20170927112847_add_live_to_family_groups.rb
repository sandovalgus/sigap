class AddLiveToFamilyGroups < ActiveRecord::Migration[5.0]
  def change
  	add_column :family_groups, :live, :boolean, default:true
  end
end

class RemoveColumnPhotocopyDocumentFromFamilyGroups < ActiveRecord::Migration[5.0]
  def change
  	remove_column :family_groups, :photocopy_document
  	remove_column :family_groups, :document
  	remove_column :family_groups, :age
  end
end

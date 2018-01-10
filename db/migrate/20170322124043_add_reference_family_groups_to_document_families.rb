class AddReferenceFamilyGroupsToDocumentFamilies < ActiveRecord::Migration[5.0]
  def change
  	remove_column :document_families, :family_group_id
  	add_reference :document_families, :family_group, foreign_key: true
  end
end

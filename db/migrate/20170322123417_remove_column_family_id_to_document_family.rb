class RemoveColumnFamilyIdToDocumentFamily < ActiveRecord::Migration[5.0]
  def change
  	remove_column :document_families, :family_id
  	remove_column :document_families, :family_groups_id
  end
end

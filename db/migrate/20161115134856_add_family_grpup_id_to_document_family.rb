class AddFamilyGrpupIdToDocumentFamily < ActiveRecord::Migration[5.0]
  def change
    add_column :document_families, :family_group_id, :integer
    add_reference :document_families, :family_groups, index: true
    add_foreign_key :document_families, :family_groups
  end
end

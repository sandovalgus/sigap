class CreateFamilyGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :family_groups do |t|
      t.string :family_ties
      t.string :name
      t.string :last_name
      t.string :document_numbre
      t.string :cuil
      t.string :photocopy_document
      t.string :document

      t.timestamps
    end
  end
end

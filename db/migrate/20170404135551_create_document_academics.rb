class CreateDocumentAcademics < ActiveRecord::Migration[5.0]
  def change
    create_table :document_academics do |t|
      t.string :document
      t.string :commentary
      t.references :academic, foreign_key: true

      t.timestamps
    end
  end
end

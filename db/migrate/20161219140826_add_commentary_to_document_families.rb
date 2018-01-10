class AddCommentaryToDocumentFamilies < ActiveRecord::Migration[5.0]
  def change
    add_column :document_families, :commentary, :string
  end
end

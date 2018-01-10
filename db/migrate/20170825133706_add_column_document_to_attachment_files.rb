class AddColumnDocumentToAttachmentFiles < ActiveRecord::Migration[5.0]
  def change
  	add_column :attachment_files, :document, :string 
  end
end

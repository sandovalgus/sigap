class AddDocumentCopyToEmployees < ActiveRecord::Migration[5.0]
  def change
  	add_column :employees, :copy_document, :string
  end
end

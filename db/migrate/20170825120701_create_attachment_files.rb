class CreateAttachmentFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :attachment_files do |t|
    	t.string		:name
    	t.string		:commentary
    	t.references	:imageable, polymorphic: true, index: true
    	t.timestamps
    end
  end
end

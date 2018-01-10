# |-------------------------------------|
# |	Attachment File class was used on 	|
# |	multiple attachment documents type	|
# |	for different models.				|
# |-------------------------------------|
class AttachmentFile < ApplicationRecord
	belongs_to :imageable, :polymorphic => true
	mount_uploader :document, DocumentUploader	
end

require 'carrierwave/orm/activerecord'
class DocumentAcademic < ApplicationRecord
  belongs_to :academic, optional: true
  mount_uploader :document, DocumentUploader
  validates 	:commentary, length: { maximum: 100 }
  #validates_presence_of :commentary,
  #						:message => "Este campo es obligatorio."
end

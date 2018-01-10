require 'carrierwave/orm/activerecord'
class Clinical < ApplicationRecord
	belongs_to :employee
	has_many :attachment_files, :as => :imageable
	accepts_nested_attributes_for :attachment_files, allow_destroy: true

	validates :name_contact, numericality: false, format: { with: /[a-zA-Z]+/, message: "se permiten solo letras" }
	validates :name_contact, :allow_blank => false, presence:  { message: "Campo obligatorio" }
	validates :tel_emergency, :allow_blank => true, presence:  { message: "Campo obligatorio" }

	extend Enumerize
		enumerize :blood_type, in:[:'AB+', :'AB-', :'A-', :'A+', :'B-', :'B+', :'O+', :'O-']
		enumerize :estado_civil, in:[:'SOLTERO/A', :'CASADO/A', :'DIVORCIADO/A', :'VIUDO/A'], default: :'SOLTERO/A'
end

require 'carrierwave/orm/activerecord'
class FamilyGroup < ApplicationRecord
	has_many :attachment_files, :as => :imageable
	accepts_nested_attributes_for :attachment_files,  allow_destroy: true

	belongs_to :employee, optional: true
	#Paper Trail se usa para el log
	has_paper_trail :on => [:create, :update, :destroy], :ignore => [:update_at, :created_at, :employee_id]

	validates :name,  presence:  { message: "Campo obligatorio" }
	validates :last_name,  presence:  { message: "Campo obligatorio" }
	validates :document_numbre,  presence:  { message: "Campo obligatorio" }
	validates :name, :last_name, format: { with: /[a-zA-Z]+/, message: "se permiten solo letras" }
	extend Enumerize
	enumerize :family_ties, in:[:'CONYUGE', :'CONCUBINO', :'PADRE', :'MADRE', :'HIJO/A', :'HERMANO/A', :'OTROS']

end

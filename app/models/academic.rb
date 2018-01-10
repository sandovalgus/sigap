#Clase Academic, aqui se ingresa el grado de estudio de un empleado.
require 'carrierwave/orm/activerecord'
class Academic < ApplicationRecord
  belongs_to :employees
  has_many :document_academics
  accepts_nested_attributes_for :document_academics, allow_destroy: true

  extend Enumerize
  enumerize :academic_training, in:[:'Secundario', :'Terciario', :'Universitario', :'Otro'], default: :'Otro'
  enumerize :status, in:[:'En Curso', :'Completo', :'Incompleto'], default: :'Completo'

  validates_presence_of :establishment,
						:discipline, 
						:message => "Este campo es obligatorio."
end

class Labor < ApplicationRecord
  belongs_to :employee
  belongs_to :function
  has_one :department, through: :function
  has_one :direction, through: :department
  has_one :general_direction, through: :direction
  has_many :attachment_files, :as => :imageable

  accepts_nested_attributes_for :attachment_files, allow_destroy: true

  accepts_nested_attributes_for :function, :department, :direction, :general_direction
  # has_many :functions
  # has_many :departments
  # has_many :directions
  validates_presence_of :function_id, :message => "Complete los campos obligatorios.", :unless => :adscribed?
  extend Enumerize
  enumerize :status, in:[:'Activo', :'Inactivo'], default: :'Activo'
  enumerize :contracting_regime, in:[:'Contrato Con Relación de Dependencia', :'Contrato Sin Relación de Dependencia', :'Planta Permanente'], default: nil
end

require 'carrierwave/orm/activerecord'
class Employee < ApplicationRecord

	has_many :family_groups
	has_many :labors
	has_many :addresses
	has_one :city, through: :addresses
	has_many :academics
	has_one :clinical
	has_many :attachment_files, :as => :imageable
	accepts_nested_attributes_for :attachment_files,  allow_destroy: true
	accepts_nested_attributes_for :addresses, allow_destroy: true

	# attr_accessor :lock_version
	# attr_accessor :original_updated_at

	has_paper_trail :on => [:create, :update, :destroy], :ignore => [:update_at, :created_at]
	accepts_nested_attributes_for :family_groups, allow_destroy: true
	mount_uploader :avatar, ImageUploader
    mount_uploader :copy_document, CopyDocumentUploader
	 

	validates :legajo, :name, :last_name,:document_number,  presence:  { message: "Campo obligatorio" }
	validates :legajo,  numericality: {  message: "	Se permite solo numeros enteros"}
	validates :legajo, length: { is: 5, :message => "Debe tener 5 digitos"}
	validates :name, :last_name, format: { with: /[a-zA-Z]+/, message: "se permiten solo letras" }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "formato email@email.com"  }, :allow_blank => true
	

	# validate :handle_conflict, on: :update
	extend Enumerize
	enumerize :document_type, in:[:'DNI', :'CI', :'LC', :'LE'], default: :'DNI'	
	enumerize :marital_state, in:[:'SOLTERO/A', :'CONCUBINO/A', :'CASADO/A', :'DIVORCIADO/A', :'VIUDO/A'], default: :'SOLTERO/A'
	enumerize :nationality, in:[:'Argentina', :'Paraguay', :'Brasil', :'Uruguay'], default: :'Argentina'
 



	#aasm colunm: "lock_version" do
	#	lock_version :locked, initial:true
	#	lock_version :unlocked
		#
	#	event :unlock do
	#		transitions from: :locked, to: :unlocked 
	#	end
	#	event :lock do
	#		transitions from: :unlocked, to: :locked 
	#	end
	#end




#   def original_updated_at
#   	@original_updated_at || updated_at.to_f 
#   end
#   attr_writer :original_updated_at

#   def handle_conflict
#   	if @conflict || updated_at.to_f > original_updated_at.to_f
#   		@conflict = true
#   		@original_updated_at = nil
#   		errors.add :base, "Hay cambios que han sido editados"
#   		changes.each do |attribute, values|
#   			errors.add attribute, "was #{values.first}"
#   		end
#   	end
# end


  # def update_with_conflict_validation(*args)
  # 		update_attributes(*args)
  # 		rescue ActiveRecord::StaleObjectError
  # 			 self.lock_version = lock_version_was
  #   		errors.add :base, "Se detecto que otro usuario esta editando este Empleado, por favor salga de la edicion del empleado actual y vuelva a ingresar en minutos." 
	 #    		changes.except("update_at").each do |name, values|
	 #    			errors.add name, "was #{values.first}";
	 #    		end
  #   	false
  # end
  # def legajo_validate?
  # 	Employee.exists?(:legajo => "David")
  # end
  # def document_number_validate?
  # 	@employee.valid?
  # end
  


end


class User < ApplicationRecord
  mount_uploader :avatar, ImageUploader
  has_paper_trail :on => [:create, :update, :destroy], :ignore => [:update_at, :current_sign_in_at, :last_sign_in_at, :sign_in_count, :updated_at, :remember_created_at, :reset_password_token, :reset_password_sent_at, :current_sign_in_ip, :last_sign_in_ip, :created_at]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:timeoutable
  #Permisos generados manualmente
  #include PermissionsConcern
  extend Enumerize
  enumerize :role, in:[:'none', :'admin'], default: :'none', presence: true
  
  def role?(r)
  	role.include? r.to_s
	end
end

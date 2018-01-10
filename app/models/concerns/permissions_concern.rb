module PermissionsConcern
	extend ActiveSupport::Concern
	#Tipos de usuarios
	def is_normal_user?
		self.permission_level >= 0
	end
	def is_admin_user?
		self.permission_level >= 1
	end
	def is_super_user?
		self.permission_level >= 2
	end
end
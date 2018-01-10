class AddUserNew2 < ActiveRecord::Migration[5.0]
  	User.create! do |u|
       u.email     = 'admin2@admin.com'
       u.password    = 'adminadmin'
       u.role = 'admin'
       u.first_name = 'gus'
	   u.last_name = 'sandoval'
 end
end

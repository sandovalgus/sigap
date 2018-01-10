class AddUserNew < ActiveRecord::Migration[5.0]
	User.create! do |u|
       u.email     = 'admin@admin.com'
       u.password    = 'adminadmin'
       u.role = 'admin'
 end
end

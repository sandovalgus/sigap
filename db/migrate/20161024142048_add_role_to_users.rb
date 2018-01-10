class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :string, default: "none"
  end
  #User.create! do |u|
  #      u.email     = 'admin@admin.com'
  #      u#.password    = 'adminadmin'
  #      u.role = 'admin'
  #  end
end

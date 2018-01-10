class AddColumnAdscribedOrganizationNameToLabors < ActiveRecord::Migration[5.0]
  def change
    add_column :labors, :adscribed_organization_name, :string
  end
end

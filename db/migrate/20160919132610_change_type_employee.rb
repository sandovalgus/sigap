class ChangeTypeEmployee < ActiveRecord::Migration[5.0]
  def up
    change_table :family_groups do |t|
      t.change :document, :string, array: true
    end
  end

  def down
    change_table :family_groups do |t|
      t.change :document, :string
    end
  end
end

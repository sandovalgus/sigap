class ChangeColumnLockVersionToEmployee < ActiveRecord::Migration[5.0]
  def up
    change_table :employees do |t|
      t.change :lock_version, :string, default: "unlocked"
    end
  end

  def down
    change_table :employees do |t|
      t.change :lock_version, :string, default: "t"
    end
  end
end

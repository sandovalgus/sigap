class RemoveColumnCategoryToLabors < ActiveRecord::Migration[5.0]
  def change
  		remove_column :labors, :category
  end
end

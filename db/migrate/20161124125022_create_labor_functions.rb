class CreateLaborFunctions < ActiveRecord::Migration[5.0]
  def change
    create_table :labor_functions do |t|
      t.references :labor, foreign_key: true
      t.references :function, foreign_key: true

      t.timestamps
    end
  end
end

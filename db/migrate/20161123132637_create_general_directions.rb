class CreateGeneralDirections < ActiveRecord::Migration[5.0]
  def change
    create_table :general_directions do |t|
      t.references :direction, foreign_key: true
      t.references :department, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end

class CreateAcademics < ActiveRecord::Migration[5.0]
  def change
    create_table :academics do |t|
      t.string :academic_training
      t.string :status
      t.date :start_data
      t.date :finish_data
      t.string :establishment
      t.string :discipline
      t.string :description
      t.references :employees, foreign_key: true

      t.timestamps
    end
  end
end

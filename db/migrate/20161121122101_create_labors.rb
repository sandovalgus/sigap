class CreateLabors < ActiveRecord::Migration[5.0]
  def change
    create_table :labors do |t|
      t.references :employee, foreign_key: true
      t.string :department
      t.string :section
      t.string :function
      t.string :category
      t.date :entry_date
      t.date :departure_date
      t.string :status

      t.timestamps
    end
  end
end

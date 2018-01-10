class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string   :neighborhood
      t.string   :address_street
      t.string   :address_number
      t.string   :address_floor
      t.string   :address_floor_apartment_number
      t.string   :address_monoblock
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end

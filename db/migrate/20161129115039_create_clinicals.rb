class CreateClinicals < ActiveRecord::Migration[5.0]
  def change
    create_table :clinicals do |t|
      t.string :tel_emergency
      t.string :name_contact
      t.string :name_social_work
      t.string :number_partner
      t.string :blood_type
      t.string :allergies
      t.string :background
      t.boolean :clinical_analyzes

      t.timestamps
    end
  end
end

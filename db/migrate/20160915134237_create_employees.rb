class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :legajo
      t.string :name
      t.string :last_name
      t.string :cuil
      t.string :document_type
      t.string :document_number
      t.datetime :birthday
      t.string :category
      t.string :function_employee
      t.string :marital_state
      t.string :relationship_of_dependency
      t.string :avatar
      t.datetime :date_of_admission
      t.boolean :active
      t.string :city
      t.string :location
      t.string :state
      t.string :country
      t.string :neighborhood
      t.string :address_street
      t.string :address_number
      t.string :address_floor
      t.string :address_floor_apartment_number
      t.string :address_monoblock
      t.string :making_performance
      t.string :legal_instrument
      t.string :email
      t.string :tel_cel
      t.string :tel_home
      t.string :other_tel
      t.string :tel_emergency
      t.string :name_contact
      t.string :tel_work
      t.string :interno_tel_work
      t.string :email_work
      t.string :name_social_work
      t.string :number_partner
      t.string :blood_type
      t.string :allergies
      t.string :background
      t.string :leaving_date
      t.string :reason
      t.string :clinical_analyzes
      t.string :suitable

      t.timestamps
    end
  end
end

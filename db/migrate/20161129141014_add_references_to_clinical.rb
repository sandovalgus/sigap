class AddReferencesToClinical < ActiveRecord::Migration[5.0]
  def change
  	add_reference :clinicals, :employee, foreign_key: true, default: nil, index: true
  end
end

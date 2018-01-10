class AddCountryRefToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_reference :employees, :country, foreign_key: true
  end
end

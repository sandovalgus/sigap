class AddCityRefToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_reference :employees, :city, foreign_key: true
  end
end

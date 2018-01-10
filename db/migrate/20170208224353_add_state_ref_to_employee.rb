class AddStateRefToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_reference :employees, :State, foreign_key: true
  end
end

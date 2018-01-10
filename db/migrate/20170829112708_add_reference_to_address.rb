class AddReferenceToAddress < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :city, foreign_key: true, index: true
  end
end
 
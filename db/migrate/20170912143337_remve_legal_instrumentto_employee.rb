class RemveLegalInstrumenttoEmployee < ActiveRecord::Migration[5.0]
  def change
  	remove_column :employees, :legal_instrument, :string
  end
end

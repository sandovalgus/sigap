class AddGeneralDirectionIdToDirection < ActiveRecord::Migration[5.0]
  def change
    add_reference :directions, :general_direction, foreign_key: true
  end
end

class AddCoordinatesToAppliances < ActiveRecord::Migration[6.1]
  def change
    add_column :appliances, :latitude, :float
    add_column :appliances, :longitude, :float
  end
end

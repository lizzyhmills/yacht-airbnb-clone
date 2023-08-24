class AddCoordinatesToYachts < ActiveRecord::Migration[7.0]
  def change
    add_column :yachts, :latitude, :float
    add_column :yachts, :longitude, :float
  end
end

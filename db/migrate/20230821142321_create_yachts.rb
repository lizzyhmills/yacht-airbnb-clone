class CreateYachts < ActiveRecord::Migration[7.0]
  def change
    create_table :yachts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :capacity
      t.float :price_per_night
      t.string :name
      t.text :description
      t.string :location
      t.text :amenities

      t.timestamps
    end
  end
end

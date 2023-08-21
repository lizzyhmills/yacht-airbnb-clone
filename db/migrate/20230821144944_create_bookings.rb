class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :yacht, null: false, foreign_key: true
      t.date :check_in
      t.date :check_out
      t.integer :guests

      t.timestamps
    end
  end
end

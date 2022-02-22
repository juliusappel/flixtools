class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :appliance, null: false, foreign_key: true
      t.string :start_date
      t.string :end_date
      t.boolean :confirmation

      t.timestamps
    end
  end
end

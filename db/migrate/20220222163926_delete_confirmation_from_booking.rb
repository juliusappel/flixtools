class DeleteConfirmationFromBooking < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :confirmation, :boolean
  end
end

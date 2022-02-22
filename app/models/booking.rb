class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :appliance

  validates :start_date, :end_date, :confirmation, presence: true
end

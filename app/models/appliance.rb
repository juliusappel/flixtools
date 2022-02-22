class Appliance < ApplicationRecord
  belongs_to :user

  validates :title, :description, :price, :location, presence: true
  validates :price, numericality: true

  # Gecode location
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?
end

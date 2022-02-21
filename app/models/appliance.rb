class Appliance < ApplicationRecord
  belongs_to :user

  validates :title, :description, :price, :location, presence: true
  validates :price, numericality: true
end

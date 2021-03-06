class Appliance < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :title, :description, :price, :location, presence: true
  validates :price, numericality: true

  # Gecode location
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search,
  against: [ :title, :description, :location ],
  using: {
    tsearch: { prefix: true }
  }
end

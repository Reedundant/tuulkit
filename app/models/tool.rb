class Tool < ApplicationRecord
  belongs_to :user
  # has_many :users
  has_many :bookings, dependent: :destroy

  validates :name, :tool_type, :price, :description, :location, presence: true

  # Geocode
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # PG Search
  include PgSearch::Model
  pg_search_scope :search_by_name_tool_type_and_location, # Name of our scope
    against: [ :name, :tool_type, :location ],
    using: {
      tsearch: { prefix: true }
    }
end

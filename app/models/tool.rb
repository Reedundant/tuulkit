class Tool < ApplicationRecord
  belongs_to :user
  # has_many :users
  has_many :bookings, dependent: :destroy

  validates :name, :tool_type, :price, :description, :location, presence: true

  geocoded_by :location # Tells geocode where to find the object's address
  after_validation :geocode, if: :will_save_change_to_location? # tells geocode, "if there was a change saves to the address, pls update and save the address"
end

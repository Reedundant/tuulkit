class Tool < ApplicationRecord
  belongs_to :user
  # has_many :users
  has_many :bookings, dependent: :destroy

  validates :name, :tool_type, :price, :description, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?
end

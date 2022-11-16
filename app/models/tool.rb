class Tool < ApplicationRecord
  belongs_to :user

  # has_many :users
  # has_many :bookings, through: :users,  dependent: :destroy

  validates :name, :tool_type, :price, :description, :location, presence: true
end

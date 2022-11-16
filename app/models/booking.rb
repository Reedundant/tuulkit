class Booking < ApplicationRecord
  belongs_to :tool
  belongs_to :user

  validates :starting_date, :end_date, presence: true
end

class Booking < ApplicationRecord
  belongs_to :tool
  belongs_to :user

  enum status: {
    accepted: 0
    # accepted: 1,
    # declined: 2
  }
  validates :starting_date, :end_date, presence: true
end

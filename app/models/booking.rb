class Booking < ApplicationRecord
  belongs_to :tool
  belongs_to :user

  validates :starting_date, :end_date, presence: true

  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }
end

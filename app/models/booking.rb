class Booking < ApplicationRecord
  belongs_to :tool
  belongs_to :user

  validates :starting_date, :end_date, :tool_id, presence: true
end

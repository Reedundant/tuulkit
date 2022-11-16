class Tool < ApplicationRecord
  belongs_to :user

  validates :name, :tool_type, :price, :description, :location, presence: true
end

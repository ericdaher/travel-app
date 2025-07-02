class TripDay < ApplicationRecord
  belongs_to :trip

  validates :day, presence: true
end

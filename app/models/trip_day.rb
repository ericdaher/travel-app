class TripDay < ApplicationRecord
  belongs_to :trip
  has_many :outings

  validates :day, presence: true
end

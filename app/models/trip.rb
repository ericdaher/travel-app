class Trip < ApplicationRecord
  belongs_to :user

  validates :end_date, comparison: { greater_than: :start_date }
end

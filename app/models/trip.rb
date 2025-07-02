class Trip < ApplicationRecord
  belongs_to :user
  has_many :days, class_name: "TripDay"

  validates :end_date, comparison: { greater_than: :start_date }

  after_create :create_days

  private

  def create_days
    (start_date.to_date...end_date.to_date).each do |day|
      days.create(day:)
    end
  end
end

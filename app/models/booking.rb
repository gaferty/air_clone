class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :venues
  validates :start_date, presence:true
  validates :end_date, presence: true, comparison: {greater_than: :start_date}
end

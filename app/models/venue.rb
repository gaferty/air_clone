class Venue < ApplicationRecord
  belongs_to :user
  validates :capacity, presence: true, comparison: {greater_than: 0}
  validates :venue_type, presence: true, inclusion: {in:['church', 'hall', 'theatre', 'restaurant', 'conference-center', 'bar']}
  validates :location, presence: true, uniqueness: {scope: :name, message: "You already have a venue with this name at this location"}
  validates :name, presence:true
  has_one_attached :photo
end

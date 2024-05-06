class Venue < ApplicationRecord
  belongs_to :users
  validates :capacity, presence: true, comparison: {greater_than: 0}
  validates :type, presence: true, inclusion: {in:['church', 'hall', 'theatre', 'restaurant', 'conference-center', 'Bar']}
  validates :location, presence: true, uniqueness: {scope: :name, message: "You already have a venue with this name at this location"}
  validates :name, presence:true
end

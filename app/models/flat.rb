class Flat < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode
end

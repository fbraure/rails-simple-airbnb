class Flat < ApplicationRecord
  validates :name, presence: true, exclusion: { in: [""] }
  validates :address, presence: true, exclusion: { in: [""] }
  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
  validates :number_of_guests, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :picture_url, presence: true, exclusion: { in: [""] }
end

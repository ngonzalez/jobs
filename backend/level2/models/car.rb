class Car < ActiveRecord::Base
  has_many :rentals, foreign_key: :car_id
  validates :price_per_day, presence: true
  validates :price_per_km, presence: true
end

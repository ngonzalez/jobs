class Rental < ActiveRecord::Base
  belongs_to :car, foreign_key: :car_id
  has_many :car_options
end

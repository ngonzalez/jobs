module GA
  module Seed
    extend ActiveSupport::Concern

    included {
      db_seed
    }

    class_methods {
      def data_input
        JSON.parse(File.read(File.open('data/input.json')))
      end
      def db_seed
        data_input['cars'].each do |hsh|
          next if Car.find_by(car_id: hsh['id'])
          Car.create!(
            car_id:        hsh['id'],
            price_per_day: hsh['price_per_day'],
            price_per_km:  hsh['price_per_km'],
          )
        end
        data_input['rentals'].each do |hsh|
          next if Rental.find_by(rental_id: hsh['id'])
          Rental.create!(
            rental_id:  hsh['id'],
            car_id:     hsh['car_id'],
            start_date: hsh['start_date'],
            end_date:   hsh['end_date'],
            distance:   hsh['distance'],
          )
        end
      end
    }
  end
end


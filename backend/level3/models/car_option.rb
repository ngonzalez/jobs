class CarOption < ActiveRecord::Base
  def price
    case self.car_option_type
    when CAR_OPTIONS_TYPES[:gps] then 500
    when CAR_OPTIONS_TYPES[:baby_seat] then 200
    when CAR_OPTIONS_TYPES[:additional_insurance] then 1000
    end
  end

  def destination
    case self.car_option_type
    when CAR_OPTIONS_TYPES[:gps] then :owner
    when CAR_OPTIONS_TYPES[:baby_seat] then :owner
    when CAR_OPTIONS_TYPES[:additional_insurance] then :get_around
    end
  end
end

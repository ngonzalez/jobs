class RentalDecorator < Draper::Decorator
  delegate_all

  def start_at
    Date.new(object.start_date.year, object.start_date.month, object.start_date.day)
  end
  
  def end_at
    Date.new(object.end_date.year, object.end_date.month, object.end_date.day)
  end

  def duration
    (end_at.end_of_day - start_at.beginning_of_day).round / 3600 / 24
  end

  def price
    price_per_day_for_duration + (object.car.price_per_km * distance)
  end

  def price_per_day_with_discount(day)
    discount = nil
    if day > 10 then discount = 50
    elsif day > 4 then discount = 30
    elsif day > 1 then discount = 10
    end
    price_per_day = car.price_per_day
    return price_per_day if discount.nil?
    price_per_day - (price_per_day * discount / 100)
  end

  def price_per_day_for_duration
    price = 0
    1.step(duration) do |day|
      price += price_per_day_with_discount(day)
    end
    price
  end

  def car_options_price
    object.car_options.sum(&:price)
  end
  
  def car_options_type
    object.car_options.pluck(:car_option_type)
  end

  def price
    price_per_day_for_duration + (object.car.price_per_km * object.distance)
  end

  def total_price
    price + car_options_price
  end

  def base_commision_fee
    price * 30 / 100
  end

  def insurance_fee
    base_commision_fee / 2
  end

  def get_amount(amount)
    1.step(duration) do |day|
      amount += 100
    end
    amount
  end

  def assistance_fee
    get_amount(0)
  end

  def drivy_fee
    base_commision_fee - insurance_fee - assistance_fee
  end

  def owner_credit
    credit = price + car_options.select { |item| item.destination == :owner }.sum(&:price)
    credit - insurance_fee - assistance_fee - drivy_fee
  end
end

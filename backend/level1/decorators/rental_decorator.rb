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
    (car.price_per_day * duration) + (car.price_per_km * distance)
  end
end

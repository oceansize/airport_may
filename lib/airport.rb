require './lib/weather'

class Airport

include Weather

  MAX_CAPACITY = 2

  def initialize(name = 'Default Airport', capacity = MAX_CAPACITY)
    @airport_name    = name
    @capacity        = capacity
    @planes_grounded = []
  end

  def name
    @airport_name
  end

  def capacity
    @capacity -= planes_grounded.count
  end

  def planes_grounded
    @planes_grounded
  end

  def is_airport_empty?
    planes_grounded.empty?
  end

  def full?
    capacity == planes_grounded.count
  end

  def dock(plane)
    if full?
      raise 'Sorry! The airport is full!'
    elsif stormy?
      weather_error
    else
      planes_grounded << plane
      plane.land!
      capacity
    end
  end

  def flight_clearance(plane)
    if stormy?
      weather_error
    else
      take_off!
      planes_grounded.delete(plane)
    end
  end

  def release(plane)
    unless stormy?
      plane.take_off!
      planes_grounded.delete(plane)
    else
      weather_error
    end
  end

end



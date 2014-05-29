class Airport

  MAX_CAPACITY = 50

  def initialize(name = 'Default Airport', capacity = MAX_CAPACITY)
    @airport_name = name
    @capacity     = capacity
    @total_planes = []

  end

  def name
    @airport_name
  end

  def capacity
    @capacity
  end

  def is_airport_empty?
    return true if @total_planes.empty?
  end

  def planes_grounded
    @planes_grounded ||= []
  end

  def dock(plane)
    @capacity -= 1
    #plane.delete

  end
end



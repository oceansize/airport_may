class Plane

  def initialize(name = 'ID: Default')
    @airborne   = false
    @plane_name = name
  end

  def name
    @plane_name
  end

  def rename(name)
    @plane_name = name
  end

  def flying?
    @airborne
  end

  def take_off!
    @airborne = true
    self
  end

  def land!
    @airborne = false
    self
  end

end
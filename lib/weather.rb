module Weather
  CHANCE_OF_SUNNY_WEATHER = 70

  def stormy?
    forecast > CHANCE_OF_SUNNY_WEATHER
  end

  def forecast
    rand(1..100)
  end

  # Could potentially put the below in Airport

  def weather_error
    raise 'Sorry! The weather is too dangerous!'
  end

end
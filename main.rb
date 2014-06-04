require_relative './lib/weather.rb'
require_relative './lib/airport.rb'
require_relative './lib/plane.rb'

class WeatherReport
  include Weather
end

@plane = Plane.new('Autoplane')
@airport = Airport.new('Autoport')
@weather = WeatherReport.new
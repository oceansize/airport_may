require './lib/airport'
require './lib/plane'
require './lib/weather'

describe 'Airport' do

class WeatherReport
  include Weather
end

let(:airport) { Airport.new }
let(:plane)   { Plane.new   }
let(:weather) { WeatherReport.new }

  context 'at initialization' do

    it 'has a default name' do
      expect(airport.name).to eq 'Default Airport'
    end

    it 'can be given a name' do
      airport = Airport.new('JFK')
      expect(airport.name).to eq 'JFK'
    end

    it 'has a default capacity' do
      expect(airport.capacity).to eq 10
    end

    it 'can be given a capacity' do
      airport = Airport.new("Luton", 25)
      expect(airport.capacity).to eq 25
    end

    it 'has no planes' do
      #expect(airport).to be_empty
      expect(airport.is_airport_empty?).to eq true
      #expect(airport.planes.count).to eq 0

    end

  end

  context 'Docking planes' do

    before(:each) do
      airport.stub(:stormy?).and_return false
    end

    it 'can dock a plane' do
      plane.take_off!
      expect(airport.planes_grounded).to eq []
      airport.dock(plane)
      expect(airport.planes_grounded).to eq [plane]
      expect(plane).not_to be_flying
    end

    it "knows when it's full" do
      expect(airport.full?).to eq false
      (airport.capacity).times { airport.dock(Plane.new) }
      expect(airport).to be_full
      #expect(airport.planes_grounded.count).to eq (airport.capacity)
    end

    xit "can't dock any more planes if max capacity has been reached"do
      airport.capacity.times { airport.dock(Plane.new) }
      expect(airport).to be_full
      expect{ airport.dock(Plane.new) }.to raise_error('Sorry! The airport is full!')
    end

  end

  context 'Releasing planes' do

    it 'can release a plane if the weather is safe' do
      airport.stub(:stormy?).and_return false
      plane.take_off!
      airport.dock(plane)
      expect(airport.planes_grounded).to eq [plane]
      airport.release(plane)
      expect(airport.planes_grounded).to eq []
      expect(plane).to be_flying
    end

    it 'will not release a plane if the weather is unsafe' do
      airport.stub(:stormy?).and_return false
      plane.take_off!
      airport.dock(plane)
      expect(airport.planes_grounded).to eq [plane]
      airport.stub(:stormy?).and_return true
      plane.take_off!
      expect{ airport.release(plane) }.to raise_error('Sorry! The weather is too dangerous!')

    end
  end

  context 'Weather' do

    it 'can receive the forecast' do
      # expect(weather.forecast).to eq nil
    end

  end

end
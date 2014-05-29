Dir["./lib/*.rb"].each {|file| require file }
require './lib/airport.rb'
require './lib/plane'

describe 'Airport' do

let(:airport) { Airport.new }
let(:plane)   { Plane.new   }

  context 'at initialization' do

    it 'has a default name' do
      expect(airport.name).to eq 'Default Airport'
    end

    it 'can be given a name' do
      airport = Airport.new('JFK')
      expect(airport.name).to eq 'JFK'
    end

    it 'has a default capacity' do
      expect(airport.capacity).to eq 50
    end

    it 'can be given a capacity' do
      airport = Airport.new("Luton", 100)
      expect(airport.capacity).to eq 100
    end

    it 'has no planes' do
      #expect(airport).to be_empty
      expect(airport.is_airport_empty?).to eq true
      #expect(airport.planes.count).to eq 0

    end

  end

  context 'Docking planes' do

    it 'can dock a plane' do
      plane.take_off!
      expect(airport.planes_grounded).to eq []
      airport.dock(plane)
      #expect(airport.planes).to eq [plane]
    end

    xit "knows when it's full" do
      expect(airport).to be_empty
      (airport.capacity).times { airport.dock(Plane.new) }
      expect(airport).to be_full
      # expect(airport.planes.count).to eq (airport.capacity)
    end

    xit "can't dock any more planes if max capacity has been reached" do
      (airport.capacity).times { airport.dock(Plane.new) }
      expect(airport).to be_full
      expect{ airport.dock(Plane.new) }.to raise_error('Sorry! The airport is full!')
    end

  end

  context 'Releasing planes' do

    xit 'can release a plane' do
      plane.take_off!
      airport.dock(plane)
      expect(airport.planes).to eq [plane]
      airport.release(plane)
      expect(airport.planes).to eq []
    end

  end

end
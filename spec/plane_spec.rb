require_relative '../lib/plane'

describe 'Plane' do

let(:plane) { Plane.new('F16') }

  context 'at initialization' do

    it 'has a default name' do
      plane = Plane.new
      expect(plane.name).to eq 'ID: Default'
    end

    it 'can be given a name' do
      expect(plane.name).to eq 'F16'
      #expect(plane_identifier).to_not eq ''
    end

    it 'can update the name of the plane' do
      plane.rename('Concorde Deluxe')
      expect(plane.name).to eq 'Concorde Deluxe'
    end

    it 'is not flying' do
      expect(plane.flying?).to eq false
    end

  end

  context 'landing and taking-off' do

    it 'can take-off' do
      expect(plane).to respond_to(:take_off!)
    end

    it 'it is not flying after taking-off' do
      # expect(plane).not_to be_flying
    plane.take_off!
    expect(plane).to be_flying
    end

    it 'it can land' do
      plane.take_off!.land!
      expect(plane.flying?).to be_false
    end

  end

end
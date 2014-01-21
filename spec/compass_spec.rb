require 'rspec'
require_relative '../lib/compass'

describe Compass do

  context 'it understands right and left rotations' do

    it 'returns one if told to turn right' do 
      expect(Compass.turn_right_or_left("R")).to eq 1
    end

    it 'returns minus one if told to turn left' do 
      expect(Compass.turn_right_or_left("L")).to eq -1
    end

    it 'return the current index of the direction it is pointing at' do 
      expect(Compass.current_index("S")).to eq 2
    end

    it 'knows that right of North is East' do 
      expect(Compass.turn("R", "N")).to eq "E"
    end

    it 'knows that right of South is West' do 
      expect(Compass.turn("R", "S")).to eq "W"
    end

    it 'knows that left of South is East' do 
      expect(Compass.turn("L","N")).to eq "W"
    end

    it 'can turn left when facing East' do 
      expect(Compass.turn("L", "W")).to eq "S"
    end

  end



end
require 'rspec'
require_relative '../lib/plateau'

describe Plateau do

  let(:plateau) {Plateau.new(5,5)}

  context 'it knows its dimensions' do 

    it 'has a specified height' do
      expect(plateau.y_boundary).to eq 5
    end
    
    it 'has a specified width' do 
      expect(plateau.x_boundary).to eq 5
    end

  end

  context 'it knows whether a coordinate is out of bounds' do 

    it 'raises error if x-coordinate is out of bounds' do 
      expect{plateau.out_of_bounds?(6,4)}.to raise_error(RuntimeError)
    end

    it 'returns false if x-coordinate is not out of bounds' do 
      expect(plateau.out_of_bounds?(4,4)).to be_false
    end

    it 'raises error if y-coordinate is out of bounds' do 
      expect{plateau.out_of_bounds?(4,6)}.to raise_error(RuntimeError)
    end

    it 'returns false if a y-coordinate is not out of bounds' do 
      expect(plateau.out_of_bounds?(4,2)).to be_false
    end

  end

end
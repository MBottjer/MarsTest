require 'rspec'
require_relative '../lib/plateau'

describe Plateau do

  let(:plateau) {Plateau.new(5,5)}
  let(:rover) {double(:Rover, :current_plateau= => nil)}

  context 'it knows its dimensions' do 

    it 'has a specified height' do
      expect(plateau.y_boundary).to eq 5
    end
    
    it 'has a specified width' do 
      expect(plateau.x_boundary).to eq 5
    end

  end

end
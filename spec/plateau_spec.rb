require 'rspec'
require_relative '../lib/plateau'

describe Plateau do

  let(:plateau) {Plateau.new(5,5)}
  let(:rover) {double(:Rover, :current_plateau= => nil)}

  it 'has a specified height' do
    expect(plateau.y_boundary).to eq 5
  end
  
  it 'has a specified width' do 
    expect(plateau.x_boundary).to eq 5
  end
  
  it 'can have a rover added to it' do 
    plateau.add(rover)
    expect(plateau.rovers.size).to eq 1
  end

end
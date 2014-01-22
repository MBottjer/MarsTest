require 'rspec'
require_relative '../lib/rover'

describe Rover do 

  let(:position) {double :Position}
  let(:rover) {Rover.new(position)}

  it 'delegates movement to its position' do 
    expect(position).to receive(:move)
    rover.move
  end

  it 'delegates rotation to its position' do 
    expect(position).to receive(:turn)
    rover.turn("R")
  end 

  it 'delegates finding its current location to its position' do 
    expect(position).to receive(:current_position)
    rover.current_position
  end 

end

  
require 'rspec'
require_relative '../lib/rover'

describe Rover do 

  let(:rover) {Rover.new}

  it 'knows the direction it is facing' do 
    expect(rover.facing("0 0 N")).to eq "N"
  end

  it 'knows its position along the x axis' do 
    expect(rover.x_coord("5 2 S")).to eq 5
  end

  it 'knows its position along the y axis' do
    expect(rover.y_coord("5 2 S")).to eq 2
  end

  # it 'is able to rotate right 90 degrees' do
  #   rover.take_directions("0 0 N", "R")
  #   expect(rover.position).to eq "0 0 E"
  # end

end
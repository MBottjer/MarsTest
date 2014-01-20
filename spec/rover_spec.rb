require 'rspec'
require_relative '../lib/rover'

describe Rover do 

  let(:rover) {Rover.new}

  # it 'knows the direction it is facing' do 
  #   expect(rover.facing("0 0 N")).to eq "N"
  # end

  it 'knows its position along the x axis' do 
    expect(rover.x_coord("5 2 S")).to eq 5
  end

  it 'knows its position along the y axis' do
    expect(rover.y_coord("5 2 S")).to eq 2
  end

  it 'is able to rotate right 90 degrees' do
    rover.move("0 0 N", "R")
    expect(rover.direction_facing).to eq "E"
  end

  it 'is able to rotate left 90 degrees' do
    rover.move("0 0 N", "L")
    expect(rover.direction_facing).to eq "W"
  end

end
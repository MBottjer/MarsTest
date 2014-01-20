require 'rspec'
require_relative '../lib/rover'

describe Rover do 

  let(:rover) {Rover.new}
  let(:rover_two) {Rover.new("5 2 S")}

  it 'knows the direction it is facing' do 
    expect(rover.facing).to eq "N"
  end

  it 'knows its position along the x axis' do 
    expect(rover_two.x_coord).to eq 5
  end

  it 'knows its position along the y axis' do
    expect(rover_two.y_coord).to eq 2
  end

  it 'knows its current position' do 
    expect(rover_two.current_position).to eq ("5 2 S")
  end

  it 'is able to rotate right 90 degrees' do
    rover.move("0 0 N", "R")
    expect(rover.direction_facing).to eq "E"
  end

  it 'is able to rotate left 90 degrees' do
    rover.move("0 0 N", "L")
    expect(rover.direction_facing).to eq "W"
  end

  it 'is able to take multiple rotational commands' do 
    rover.move("0 0 N", "RLRLRLLL")
    expect(rover.direction_facing).to eq "S"
  end

  it 'is able to take multiple rotational commands' do 
    rover.move("0 0 N", "RLLLRLLL")
    expect(rover.direction_facing).to eq "N"
  end

  it 'can move one space up the y-axis' do 
    rover.move("0 0 N", "M")
    expect(rover.current_position).to eq ("0 1 N")
  end

 
end
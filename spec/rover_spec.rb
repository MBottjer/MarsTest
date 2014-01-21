require 'rspec'
require_relative '../lib/rover'

describe Rover do 

  let(:rover) {Rover.new}
  let(:rover_two) {Rover.new([5, 2, "S"])}

  COMPASS = ["N", "E", "S", "W"]

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
    expect(rover_two.current_location).to eq ("5 2 S")
  end

  it 'returns one if commanded to turn right' do 
    expect(rover.right_or_left("R")).to eq 1
  end

  it 'returns minus one if commanded to turn left' do 
    expect(rover.right_or_left("L")).to eq -1
  end

  it 'can give the index of the direction it is currently facing using the compass constant' do 
    expect(rover.index_of_currently_facing).to eq 0
  end

  it 'is able to rotate right 90 degrees' do
    rover.move("R")
    expect(rover.facing).to eq "E"
  end

  it 'is able to rotate left 90 degrees' do
    rover.move("L")
    expect(rover.facing).to eq "W"
  end

  it 'is able to take multiple rotational commands' do 
    rover.move("RLRLRLLL")
    expect(rover.facing).to eq "S"
  end

  it 'is able to take multiple rotational commands' do 
    rover.move("RLLLRLLL")
    expect(rover.facing).to eq "N"
  end  
    
  it "can update it's current position" do
    rover.x_coord = 3
    rover.y_coord = 3
    rover.update_current_position
    expect(rover.current_location).to eq '3 3 N'
  end

  it 'can move one space up the y-axis' do 
    rover.move("M")
    expect(rover.current_location).to eq ("0 1 N")
  end

  it 'can rotate and move simultaneously' do 
    rover.move("MRMLM")
    expect(rover.current_location).to eq "1 2 N"
  end

 
end

  
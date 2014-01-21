require 'rspec'
require_relative '../lib/position'

describe Position do 

  let(:position) {Position.new}
  let(:position_two) {Position.new(0,0,"E")}
  let(:position_three) {Position.new(5,0,"N")}

  it 'has a default x_coordinate of 0' do 
    expect(position.x_coord).to eq 0
  end

  it 'has a default y_coordinate of 0' do 
    expect(position.y_coord).to eq 0
  end

  it 'is by default facing North' do 
    expect(position.facing).to eq "N"
  end

  it 'can turn right such that it is now facing East' do
    position.turn_right
    expect(position.facing).to eq "E"
  end

  it 'can turn left such that it is now facing West' do 
    position.turn_left
    expect(position.facing).to eq "W"
  end

  it 'can turn according to the direction provided' do 
    position.turn("R")
    expect(position.facing).to eq "E"
  end 

  it 'can change its y coordinate upon moving along the y-axis' do 
    position.move_vertically
    expect(position.y_coord).to eq 1
  end

  it 'can change its x coordinate upon moving along the x-axis' do 
    position_two.move_horizontally
    expect(position_two.x_coord).to eq 1
  end

  it 'can return a full set of x and y coordinates and the direction it is facing after being moved' do 
    position.move_vertically
    position.turn("R")
    position.move_horizontally
    expect(position.current_position).to eq "1 1 E"
  end

  it 'is out of bounds when the x coordinate is bigger than the plateaus bounds' do 
    lambda { position_three.move }.should raise_error(RuntimeError)
  end

  it 'is within the boundaries when the y and x coordinates are less than the plateaus bounds' do 
    expect(position.out_of_bounds?).to be_false
  end


end
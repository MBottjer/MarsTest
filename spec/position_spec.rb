require 'rspec'
require_relative '../lib/position'

describe Position do 

  let(:position) {Position.new}

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

  it 'can change its y coordinate upon moving along the y-axis' do 
    position.move
    expect(position.y_coord).to eq 1
  end


end
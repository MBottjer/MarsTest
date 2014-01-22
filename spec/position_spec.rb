require 'rspec'
require_relative '../lib/position'

describe Position do 

  let(:position) {Position.new}
  let(:position_two) {Position.new(0,0,"E")}
  let(:position_three) {Position.new(5,0,"E")}
  let(:position_four) {Position.new(6,6,"N")}

  context 'it has an x-coordinate, y-coordinate, direction it is facing and is initialized with a plateau' do  

    it 'has a default x_coordinate of 0' do 
      expect(position.x_coord).to eq 0
    end

    it 'has a default y_coordinate of 0' do 
      expect(position.y_coord).to eq 0
    end

    it 'is by default facing North' do 
      expect(position.facing).to eq "N"
    end

    it 'by default has a plateau which has boundaries' do 
      expect(position.plateau.y_boundary).to eq 5
    end

  end

  context 'it is able to the change direction it is facing' do 

    it 'can turn right such that it is now facing East' do
      position.turn_right
      expect(position.facing).to eq "E"
    end

    it 'can turn left such that it is now facing West' do 
      position.turn_left
      expect(position.facing).to eq "W"
    end

    it 'can turn right if the direction is provided' do 
      position.turn("R")
      expect(position.facing).to eq "E"
    end

    it 'can turn left if the direction is provided' do 
      position.turn("L")
      expect(position.facing).to eq "W"
    end 

  end

  context 'it is able to change its position by moving' do 

    it 'is able to determine whether it is facing north or south' do 
      expect(position.north_south_facing?).to be_true
    end

    it 'is able to determine whether it is not north or south facing' do 
      expect(position_three.north_south_facing?).to be_false
    end

    it 'it is able to return an array of coordinates with an updated y-coordinate' do 
      expect(position.updated_y).to eq [0,1]
    end

    it 'it is able to return an array of coordinates with an updated x-coordinate' do 
      expect(position_two.updated_x).to eq [1,0]
    end

    it 'can update its y_coordinate upon moving' do 
      position.move
      expect(position.y_coord).to eq 1
    end

    it 'can update its x_coordinate upon moving' do 
      position_two.move
      expect(position_two.x_coord).to eq 1
    end

    it 'raises an error if the move pushes the position out of bounds' do 
      expect{position_three.move}.to raise_error(RuntimeError)
    end

  end

end
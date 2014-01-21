require 'rspec'
require_relative '../lib/nasainterface'

describe Interface do

  let(:interface) {Interface.new}
  let(:position) {Position.new}
  let(:rover) {Rover.new(position)}

  it 'can move the rover taking in a string of commands' do 
    interface.send("MMRML", position)
    expect(position.y_coord).to eq 2
  end

  # it 'can move the rover' do
  #   interface.send("RML", rover_one)
  #   expect(rover_one).to receive(:move).and_return "1 0 N" 
  #   expect(rover_one.current_location).to eq "1 0 N"
  # end

  # it 'can add a rover to the palteau' do 
  #   interface.add(rover, plateau)
  #   expect

end
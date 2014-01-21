require 'rspec'
require_relative '../lib/nasainterface'

describe Interface do

  let(:interface) {Interface.new}
  let(:rover_one) {double(:Rover, :current_location => "0 0 N")}

  it 'can move the rover' do
    interface.send("RML", rover_one)
    expect(rover_one).to receive(:move).and_return "1 0 N" 
    expect(rover_one.current_location).to eq "1 0 N"
  end

  # it 'can add a rover to the palteau' do 
  #   interface.add(rover, plateau)
  #   expect

end
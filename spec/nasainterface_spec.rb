require 'rspec'
require_relative '../lib/nasainterface'

describe Interface do

  let(:interface) {Interface.new}
  let(:rover_one) {double(:Rover, :current_location => "0 0 N")}

  it 'can move the rover' do 
    Interface.send("RML", rover_one)
    expect(rover_one.current_location).to eq "1 0 N"
  end

end
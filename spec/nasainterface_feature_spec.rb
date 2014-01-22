require 'rspec'
require_relative '../lib/nasainterface'

describe Interface, " and integration of classes" do

  let(:interface) {Interface.new(File.open('spec/fixtures/input.txt').read)}
  let(:rover) {Rover.new}
  let(:rover_two) {Rover.new(Position.new(1,2,"N"))}

  it 'can relocate the rover' do 
    interface.relocate("M", rover)
    expect(rover.current_position).to eq "0 1 N"
  end

  it 'can turn the rover left' do 
    interface.relocate("L", rover)
    expect(rover.current_position).to eq "0 0 W"
  end

  it 'can turn the rover right' do 
    interface.relocate("R", rover)
    expect(rover.current_position).to eq "0 0 E"
  end

  it 'can relocate the rover taking in multiple commands' do 
    interface.execute_commands("MMRMLM", rover)
    expect(rover.current_position).to eq "1 3 N"
  end

  it 'can send a string of commands and a rovers position and return an array of the outputs' do 
    expect(interface.send_rover_position_and_commands).to eq [["1 3 N"], ["5 1 E"]]
  end

  it 'can simply use the selected file initialized with the interface and provide the output as an array' do 
    expect(interface.output).to eq ["1 3 N", "5 1 E"]
  end


end
require 'rspec'
require_relative '../lib/nasainterface'

describe Interface, " and integration of classes" do

  let(:interface) {Interface.new(IO.read('spec/fixtures/input.txt'))}
  let(:interface_two) {Interface.new(IO.read('spec/fixtures/test_input.txt'))}
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

  it 'is able to take a rectangular plateau, any positions, multiple rovers and many commands' do
    expect($stdout).to receive(:puts).exactly(3).times
    expect(interface_two.output_positions).to eq ["5 4 W", "5 2 N", "1 2 S"]
  end

  it 'uses the mentioned input in the input file to provide the solution' do 
    expect($stdout).to receive(:puts).twice
    expect(interface.output_positions).to eq ["1 3 N", "5 1 E"]
  end


end
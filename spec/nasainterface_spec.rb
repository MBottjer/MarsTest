require 'rspec'
require_relative '../lib/nasainterface'

describe Interface do

  let(:interface) {Interface.new}
  let(:rover) {Rover.new}
  let(:rover_two) {Rover.new(Position.new(1,2,"N"))}

  # it 'can move the rover taking in a string of commands' do 
  #   interface.send("MMRML", rover)
  #   expect(rover.current_position).to eq "1 2 N"
  # end

  it 'can relocate the rover' do 
    interface.relocate("M", rover)
    expect(rover.current_position).to eq "0 1 N"
  end

  it 'can turn the rover left' do 
    interface.relocate("L", rover)
    expect(rover.current_position).to eq "0 0 W"
  end

  # it 'can turn the rover left and move' do 
  #   interface.execute_commands("LMLMLMLMM", rover_two)
  #   expect(rover_two.current_position).to eq "1 3 N"
  # end

  it 'can relocate the rover taking in multiple commands' do 
    interface.execute_commands("MMRMLM", rover)
    expect(rover.current_position).to eq "1 3 N"
  end

  it 'can convert the input from the text file into an array' do 
    expect(interface.get_input_as_array).to eq ["5 5\n", "1 2 N\n", "LMLMLMLMM\n", "3 3 E\n", "MMRMMRMRRM"]
  end

  it 'can take the first line of input' do 
    expect(interface.get_boundaries).to eq [5,5]
  end

  it 'can remove the first line of input' do 
    expect(interface.remove_boundary_input).to eq ["1 2 N\n", "LMLMLMLMM\n", "3 3 E\n", "MMRMMRMRRM"]
  end

  it 'can split rover positions and commands into array pairs' do 
    expect(interface.send_rover_position_and_commands).to eq [["1 3 N"], ["5 1 E"]]
  end

  # it 'can split a pair of positions and commands into their an array of positions' do 
  #   expect(interface.get_rover_positions).to eq [["1", "2", "N"], ["3", "3", "E"]]
  # end

  # it 'can take the commands from the position command pairs' do 
  #   expect(interface.get_commands).to eq 

  # it 'can take the second and third line of input' do
  #   expect(interface.get_first_rover_input).to eq "1 2 N\nLMLMLMLMM\n"
  # end

  # it 'cant take three lines of input and produce a result' do 
  #   expect(interface.process_information(IO.read('spec/fixtures/input.txt'))).to eq "1 3 N"
  # end

  # it 'can move the rover' do
  #   interface.send("RML", rover_one)
  #   expect(rover_one).to receive(:move).and_return "1 0 N" 
  #   expect(rover_one.current_location).to eq "1 0 N"
  # end

  # it 'can add a rover to the palteau' do 
  #   interface.add(rover, plateau)
  #   expect

end
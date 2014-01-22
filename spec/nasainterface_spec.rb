require 'rspec'
require_relative '../lib/nasainterface'

describe Interface do

  let(:interface) {Interface.new(File.open('spec/fixtures/input.txt').read)}
  let(:rover) {Rover.new}
  let(:rover_two) {Rover.new(Position.new(1,2,"N"))}

  it 'can convert the input from the text file into an array' do 
    expect(interface.get_input_as_array).to eq ["5 5\n", "1 2 N\n", "LMLMLMLMM\n", "3 3 E\n", "MMRMMRMRRM"]
  end

  it 'can convert a string seperated by spaces into an array' do 
    string = "3 6 7 2 8"
    expect(string.split).to eq ["3","6","7","2","8"]
  end

  it 'can convert an array of strings into intgers' do 
    array = ["3","6","7","2","8"]
    expect(array.map {|number| number.to_i}).to eq [3,6,7,2,8]
  end

  it 'can take the first line of input' do 
    expect(interface.get_boundaries).to eq [5,5]
  end

  it 'can remove the first value in an array' do 
    array = [1,2,3,4]
    expect(array[1..-1]).to eq [2,3,4]
  end

  it 'can remove the first line of input' do 
    expect(interface.remove_boundary_input).to eq ["1 2 N\n", "LMLMLMLMM\n", "3 3 E\n", "MMRMMRMRRM"]
  end

  it 'can send a string of commands and a rovers position and return an array of the outputs' do 
    expect(interface.send_rover_position_and_commands).to eq [["1 3 N"], ["5 1 E"]]
  end

end
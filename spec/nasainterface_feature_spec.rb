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

  it 'can relocate the rover taking in multiple commands' do 
    interface.execute_commands("MMRMLM", rover)
    expect(rover.current_position).to eq "1 3 N"
  end


end
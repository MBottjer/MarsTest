require_relative 'rover'
require_relative 'plateau'
require_relative 'compass'


class Interface

  attr_reader :plateau_to_explore, :input

  def initialize(input)
    @input = input
    @plateau_to_explore = Plateau.new(get_boundaries[0], get_boundaries[1])
  end

  def get_input_as_array
    array = [] ; input.each_line { |line| array << line } ; array
  end

  def get_boundaries
    get_input_as_array[0].split.map {|number| number.to_i}
  end

  def remove_boundary_input
    get_input_as_array[1..-1]
  end

  def relocate(command, rover)
    command == "M" ? rover.move : rover.turn(command)
  end

  def execute_commands(commands, rover)
    commands.split("").each { |command| relocate(command, rover)}
  end

  def send_rover_position_and_commands
    rover_positions = []
    remove_boundary_input.each_slice(2) do |start_pos, commands|
      rover = create_rover_at(start_pos)
      execute_commands(commands.strip, rover)
      rover_positions << [rover.current_position]
    end
    rover_positions
  end

  def array_of_output
    send_rover_position_and_commands.map { |array| array.join(' ') }
  end

  def output
    array_of_output.each { |string| puts string }
  end

  def create_rover_at(start_pos)
    array = start_pos.split
    Rover.new(Position.new(array[0].to_i, array[1].to_i, array[2], @plateau_to_explore))
  end

end

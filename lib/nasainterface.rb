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
    array = []
    input.each_line { |line| array << line }
    array
  end

  # def read_input
  #   File.open('spec/fixtures/input.txt').read
  # end

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
    rover_info = []
    remove_boundary_input.each_slice(2) do |start_pos, commands|
      rover = create_rover_at(start_pos)
      execute_commands(commands.strip, rover)
      rover_info << [rover.current_position]
    end
    rover_info
  end

  def output
    send_rover_position_and_commands.map { |array| array.join(' ') }.each { |string| puts string }
  end

  def create_rover_at(start_pos)
    array = start_pos.split
    Rover.new(Position.new(array[0].to_i, array[1].to_i, array[2], @plateau_to_explore))
  end

  def get_rover_positions
    get_rover_position_and_commands.map { |pair| pair[0].split}
  end

  def iterate_through_rovers
    get_rover_positions.each {|rover_position| rover_position}
  end

  def setup_plateau
    Plateau.new(get_boundaries[0], get_boundaries[1])
  end

  def setup_rover
    Rover.new(Position.new(iterate_through_rovers[0].to_i, iterate_through_rovers[1].to_i, iterate_through_rovers[2]))
  end

  def array_of(commands)
    commands.split('')
  end

  def process_information(file)
    send
  end

end

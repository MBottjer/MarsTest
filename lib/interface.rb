require_relative 'rover'
require_relative 'plateau'
require_relative 'compass'


class Interface

  attr_reader :plateau_to_explore, :input

  def initialize(input)
    @input = input.lines
    setup_plateau!
  end

  def setup_plateau!
    boundaries = parse_boundaries(@input.shift)
    @plateau_to_explore = Plateau.new(*boundaries)
  end

  def parse_boundaries(bondaries)
    bondaries.split.map(&:to_i)
  end

  def relocate(command, rover)
    command == "M" ? rover.move : rover.turn(command)
  end

  def execute_commands(commands, rover)
    commands.split("").each { |command| relocate(command, rover)}
  end

  def send_rover_position_and_commands
    rover_positions = []
    @input.each_slice(2) do |start_pos, commands|
      rover = release_rover_at(start_pos)
      execute_commands(commands.strip, rover)
      rover_positions << [rover.current_position]
    end
    rover_positions
  end

  def parse_start_position(start_pos)
    x, y, facing = start_pos.split
    x, y = x.to_i, y.to_i
    [x, y, facing, @plateau_to_explore]
  end

  def release_rover_at(start_pos)
    position = parse_start_position(start_pos)
    Rover.new(Position.new(*position))
  end

  def new_positions
    send_rover_position_and_commands.map { |array| array.join(' ') }
  end

  def output_positions
    new_positions.each { |position| puts position }
  end

end

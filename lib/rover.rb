require_relative 'position'

class Rover
  
  attr_reader :position
  
  COMPASS = ["N", "E", "S", "W"]


  def initialize(position = Position.new)
    @position = position
    @current_plateau = nil
  end

  def move
    @position.move
  end

  def turn(direction)
    @position.turn(direction)
  end

  def current_position
    @position.current_position
  end

end
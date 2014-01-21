require_relative 'position'

class Rover
  
  attr_reader :position
  
  COMPASS = ["N", "E", "S", "W"]


  def initialize(position)
    @position = position
    @current_plateau = nil
  end

  def move
    @position.move
  end

  def turn(direction)
    @position.turn(direction)
  end

end
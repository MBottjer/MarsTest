require_relative 'compass'

class Position 

  attr_reader :x_coord

  def intitialize(x_coord=0, y_coord=0)
    @x_coord = x_coord
    @y_coord = y_coord
  end



end
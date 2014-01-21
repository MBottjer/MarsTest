class Position 

  attr_accessor :x_coord, :y_coord, :facing

  MOVEMENT_ACTIONS = {"N" => 1, "E" => 1, "S" => -1, "W" => -1}

  def initialize(x_coord=0, y_coord=0, facing="N")
    @x_coord, @y_coord, @facing = x_coord, y_coord, facing
  end

  def turn_right
    @facing = Compass.turn("R", facing)
  end

  def turn_left
    @facing = Compass.turn("L", facing)
  end

  # def move 
  #   case facing
  #     when "N" then @y_coord += 1
  #     when "E" then @x_coord += 1 
  #     when "S" then @y_coord -= 1
  #     when "W" then @x_coord -= 1
  #   end
  # end

  def move_vertically
    @y_coord += MOVEMENT_ACTIONS[@facing]
  end

  def move_horizontally 
    @x_coord += MOVEMENT_ACTIONS[@facing]
  end

  def move 
    if @facing == "N" || @facing == "S"
      move_vertically
    else
      move_horizontally
    end
  end

end
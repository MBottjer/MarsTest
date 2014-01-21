class Position 

  attr_accessor :x_coord, :y_coord, :facing

  # MOVEMENT_ACTIONS = {"N" => 1, "E" => 1, "S" => -1, "W" => -1}

  def initialize(x_coord=0, y_coord=0, facing="N")
    @x_coord, @y_coord, @facing = x_coord, y_coord, facing
  end

  def turn_right
    @facing = Compass.turn("R", facing)
  end

  def turn_left
    @facing = Compass.turn("L", facing)
  end



  








end
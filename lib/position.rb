class Position 

  attr_accessor :x_coord, :y_coord, :facing, :plateau

  MOVEMENT_ACTIONS = {"N" => 1, "E" => 1, "S" => -1, "W" => -1}

  def initialize(x_coord=0, y_coord=0, facing="N", plateau = Plateau.new(5,5))
    @x_coord, @y_coord, @facing, @plateau = x_coord, y_coord, facing, plateau
  end

  def turn_right
    @facing = Compass.turn("R", facing)
  end

  def out_of_y_axis
    y_coord > @plateau.y_boundary || y_coord < 0
  end

  def out_of_x_axis
    x_coord > @plateau.x_boundary || x_coord < 0
  end

  def out_of_bounds
    if out_of_y_axis || out_of_x_axis
      raise "NASA's budget was too low for us to explore this region"
    end
  end

  def turn_left
    @facing = Compass.turn("L", facing)
  end

  def turn(direction)
    direction == "R" ? turn_right : turn_left
  end

  def move_vertically
    @y_coord += MOVEMENT_ACTIONS[@facing]
  end

  def move_horizontally
    @x_coord += MOVEMENT_ACTIONS[@facing]
  end

  def move
    unless out_of_bounds
      @facing == "N" || @facing == "S" ? move_vertically : move_horizontally
    end
  end

  def current_position
    "#{x_coord} #{y_coord} #{facing}"
  end

end
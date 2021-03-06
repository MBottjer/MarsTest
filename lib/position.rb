class Position 

  attr_accessor :x_coord, :y_coord, :facing, :plateau

  MOVEMENT_ACTIONS = {"N" => 1, "E" => 1, "S" => -1, "W" => -1}

  def initialize(x_coord=0, y_coord=0, facing="N", plateau = Plateau.new(5,5))
    @x_coord, @y_coord, @facing, @plateau = x_coord, y_coord, facing, plateau
  end

  def turn_right
    @facing = Compass.turn("R", facing)
  end

  def turn_left
    @facing = Compass.turn("L", facing)
  end

  def turn(direction)
    direction == "R" ? turn_right : turn_left
  end

  def north_south_facing?
    (@facing == "N" || @facing == "S")
  end

  def updated_y
    [@x_coord, @y_coord + MOVEMENT_ACTIONS[@facing]]
  end

  def updated_x
    [@x_coord + MOVEMENT_ACTIONS[@facing], @y_coord]
  end

  def move
    new_coords = north_south_facing? ? updated_y : updated_x

    unless out_of_bounds?(*new_coords)
      @x_coord, @y_coord = new_coords[0], new_coords[1]
    end
  end

  def out_of_bounds?(x_coord, y_coord)
    @plateau.out_of_bounds?(x_coord, y_coord) == true 
  end

  def current_position
    "#{x_coord} #{y_coord} #{facing}"
  end

end
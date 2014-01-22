class Plateau 

  attr_reader :x_boundary, :y_boundary

  def initialize(x_boundary, y_boundary)
    @x_boundary = x_boundary
    @y_boundary = y_boundary
  end

  def out_of_bounds?(x_coordinate, y_coordinate)
    raise "NASA's budget was too low for us to explore this region" if x_coordinate > x_boundary || y_coordinate > y_boundary
  end

end
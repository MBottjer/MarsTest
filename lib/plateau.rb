class Plateau 

  attr_reader :x_boundary, :y_boundary, :rovers


  def initialize(x_boundary, y_boundary, rovers = [])
    @x_boundary = x_boundary
    @y_boundary = y_boundary
    @rovers = rovers
  end

end
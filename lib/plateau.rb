class Plateau 

  attr_reader :x_boundary, :y_boundary, :rovers


  def initialize(x_boundary, y_boundary, rovers = [])
    @x_boundary = x_boundary
    @y_boundary = y_boundary
    @rovers = rovers
  end
  
  # here I am letting the rover know the plateau it belongs to
  # however I have already let the plateau know the rovers it has
  def add(rover)
    rover.current_plateau = self
    @rovers << rover 
  end

end
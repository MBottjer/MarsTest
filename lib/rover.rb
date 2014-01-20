class Rover

  direction_facing = ["N", "E", "S", "W"]

  def facing(current_location) 
    current_location.split[2]
  end

  def x_coord(current_location)
    current_location.split[0].to_i
  end

  def y_coord(current_location)
    current_location.split[1].to_i
  end



  # def take_directions(current_location, direction_to_face)
    
  # end


end
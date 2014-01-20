class Rover

  attr_accessor :direction_facing

  # def facing(current_location) 
  #   current_location.split[2]
  # end

  def x_coord(current_location)
    current_location.split[0].to_i
  end

  def y_coord(current_location)
    current_location.split[1].to_i
  end

  def move(current_location, command)
    compass = ["N", "E", "S", "W"]
    @direction_facing = compass[new_direction(command)]
  end

  def new_direction(command)
    number = 0 
    if command == "R"
      number += 1 
    elsif command == "L"
      number -= 1
    end
    number 
  end



  # def take_directions(current_location, direction_to_face)
    
  # end


end
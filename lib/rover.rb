class Rover

  attr_reader :direction_facing
  attr_accessor :current_location

  def initialize(current_location = "0 0 N")
    @current_location = current_location
  end

  def facing 
    current_location.split[2]
  end

  def x_coord
    current_location.split[0].to_i
  end

  def y_coord
    current_location.split[1].to_i
  end

  def current_position
    current_location
  end

  def move(current_location, command)
    compass = ["N", "E", "S", "W"]
    @direction_facing = compass[new_direction(command)]
  end

  def new_direction(command)
    command.split("").inject(0) do |sum, letter|
      if letter == "R"
        sum += 1
      elsif letter == "L"
        sum -= 1
      end
      sum % 4 
    end
  end



  # def take_directions(current_location, direction_to_face)
    
  # end


end
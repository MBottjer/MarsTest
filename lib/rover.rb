class Rover
  
  attr_accessor :current_location, :facing, :x_coord, :y_coord, :current_plateau
  
  COMPASS = ["N", "E", "S", "W"]

  def initialize(current_location = [0, 0, "N"])
    @x_coord = current_location[0]
    @y_coord = current_location[1]
    @facing = current_location[2]
    @current_location = "#{x_coord} #{y_coord} #{facing}"
    @current_plateau = nil
  end
  
  def update_current_position
    @current_location = "#{@x_coord} #{@y_coord} #{@facing}"
  end


  # take this out of rover and put into interface class
  def move(command)  
    command.split('').each do |com|
      new_direction(com) if com == 'L' || com == 'R'
      new_position if com == 'M'
      update_current_position
    end
  end
  
  def new_position
    if facing == "N"
      @y_coord += 1 
    elsif facing == "E"
      @x_coord += 1 
    elsif facing == "S"
      @y_coord -= 1
    else 
      @x_coord -= 1
    end
  end

  def new_direction(command)
    now_facing = check_rotation(index_of_currently_facing + right_or_left(command))
    @facing = COMPASS[now_facing]
  end

  def index_of_currently_facing
    COMPASS.index(@facing)
  end

  def right_or_left(command)
    command == "R" ? 1 : -1
  end
  
  def check_rotation(index_of_currently_facing)
    if index_of_currently_facing > 3
      index_of_currently_facing -= 4
    elsif index_of_currently_facing < 0
      index_of_currently_facing += 4
    else
      index_of_currently_facing
    end
  end

end
require_relative 'rover'
require_relative 'plateau'
require_relative 'compass'


class Interface

  def send(commands, rover)  
    array_of(commands).each do |command| 
      relocate(command, rover)
    end
  end

  def relocate(command, rover)
    command == "M" ? rover.move : rover.turn(command)
  end


  def array_of(commands)
    commands.split('')
  end


end
require_relative 'rover'
require_relative 'plateau'

class Interface

  # def send(commands, rover)  
  #   array_of(commands).each {|command| rover.move(command)}
  # end

  def array_of(commands)
    commands.split('')
  end


end
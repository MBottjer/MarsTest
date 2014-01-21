require_relative 'rover'
require_relative 'plateau'

class Interface

  def send(commands, rover)  
    commands.split('').each {|command| rover.move(command)}
  end

end
require_relative 'rover'
require_relative 'plateau'

class Interface

  def send(commands, position)  
    array_of(commands).each {|command| position.move}
  end

  def array_of(commands)
    commands.split('')
  end


end
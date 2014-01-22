require_relative 'rover'
require_relative 'plateau'
require_relative 'compass'
require_relative 'nasainterface'

interface = Interface.new(IO.read('../spec/fixtures/input.txt'))
interface.output_positions
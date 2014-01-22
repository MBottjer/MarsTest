require_relative './lib/rover'
require_relative './lib/plateau'
require_relative './lib/compass'
require_relative './lib/interface'

interface = Interface.new(IO.read('./spec/fixtures/input.txt'))
interface.output_positions
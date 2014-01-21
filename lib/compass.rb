class Compass

  DIRECTIONS = %w(N E S W)

  def self.turn(rotate, pointing)
    DIRECTIONS[(current_index(pointing) + turn_right_or_left(rotate)) % 4]
  end

  def self.current_index(pointing)
    DIRECTIONS.index(pointing)
  end

  def self.turn_right_or_left(rotate)
    if rotate == "R" then number = 1 else number = (-1) end
  end

end
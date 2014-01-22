class Compass

  DIRECTIONS = %w(N E S W)

  def self.turn(rotate, pointing_at)
    DIRECTIONS[(current_index(pointing_at) + turn_right_or_left(rotate)) % 4]
  end

  def self.current_index(pointing_at)
    DIRECTIONS.index(pointing_at)
  end

  def self.turn_right_or_left(rotate)
    rotate == "R" ? 1 : (-1)
  end

end
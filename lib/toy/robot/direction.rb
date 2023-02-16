# frozen_string_literal: true

module Direction
  NORTH = "NORTH"
  SOUTH = "SOUTH"
  EAST = "EAST"
  WEST = "WEST"

  def self.right_of(direction)
    {
      Direction::NORTH => Direction::EAST,
      Direction::EAST => Direction::SOUTH,
      Direction::SOUTH => Direction::WEST,
      Direction::WEST => Direction::NORTH
    }[direction]
  end

  def self.left_of(direction)
    {
      Direction::NORTH => Direction::WEST,
      Direction::WEST => Direction::SOUTH,
      Direction::SOUTH => Direction::EAST,
      Direction::EAST => Direction::NORTH
    }[direction]
  end

  def self.valid?(direction)
    [Direction::NORTH, Direction::EAST, Direction::WEST, Direction::SOUTH].include?(direction)
  end
end

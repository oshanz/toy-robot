# frozen_string_literal: true

module Direction
  NORTH = "north"
  SOUTH = "south"
  EAST = "east"
  WEST = "west"

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
end

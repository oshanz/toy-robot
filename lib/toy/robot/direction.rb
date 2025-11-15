# frozen_string_literal: true

class Direction
  NORTH = "NORTH"
  SOUTH = "SOUTH"
  EAST = "EAST"
  WEST = "WEST"

  attr_accessor :direction

  def initialize(direction)
    raise ValidationError, "Invalid Direction" unless valid?(direction)

    self.direction = direction
  end

  def switch_right
    self.direction = {
      Direction::NORTH => Direction::EAST,
      Direction::EAST => Direction::SOUTH,
      Direction::SOUTH => Direction::WEST,
      Direction::WEST => Direction::NORTH
    }[direction]
  end

  def switch_left
    self.direction = {
      Direction::NORTH => Direction::WEST,
      Direction::WEST => Direction::SOUTH,
      Direction::SOUTH => Direction::EAST,
      Direction::EAST => Direction::NORTH
    }[direction]
  end

  def report
    direction
  end

  private

  def valid?(direction)
    [Direction::NORTH, Direction::EAST, Direction::WEST, Direction::SOUTH].include?(direction)
  end
end

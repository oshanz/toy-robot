# frozen_string_literal: true

class Direction
  def initialize(direction)
    @direction = direction
    raise ValidationError, "Invalid Direction" unless valid?
  end

  def switch_right
    index = directions.index(direction)
    right_index = (index + 1) % directions.length
    self.direction = directions[right_index]
  end

  def switch_left
    index = directions.index(direction)
    left_index = (index - 1) % directions.length
    self.direction = directions[left_index]
  end

  def report
    direction
  end

  private

  attr_accessor :direction

  def directions
    %w[NORTH EAST SOUTH WEST]
  end

  def valid?
    directions.include?(direction)
  end
end

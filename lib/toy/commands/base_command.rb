# frozen_string_literal: true

class BaseCommand
  def initialize(robot)
    @robot = robot
    @errors = []
    raise ValidationError, errors.join(", ") unless valid?
  end

  def execute(_args)
    raise NotImplementedError
  end

  private

  attr_reader :robot
  attr_accessor :errors

  def valid?
    self.errors = []
    errors << "Robot was not placed" if robot_required? && robot.nil?
    errors.empty?
  end

  def robot_required?
    true
  end
end

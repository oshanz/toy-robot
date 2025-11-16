class BaseCommand
  attr_reader :robot

  def initialize(robot)
    @robot = robot
    errors = valid?
    raise ValidationError, errors.join(", ") unless errors.empty?
  end

  def execute(_args)
    raise NotImplementedError
  end

  private

  def valid?
    errors = []
    errors << "Robot was not placed" if robot.nil?
    errors
  end
end

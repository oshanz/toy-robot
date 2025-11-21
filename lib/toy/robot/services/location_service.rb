# frozen_string_literal: true

class LocationService
  def self.goto_next(location, direction)
    method = direction.report.downcase
    send("#{method}_from", location)
  end

  class << self
    private

    def north_from(location)
      Location.new(location.x_unit, location.y_unit + 1, location.table)
    rescue ValidationError
      location
    end

    def south_from(location)
      Location.new(location.x_unit, location.y_unit - 1, location.table)
    rescue ValidationError
      location
    end

    def west_from(location)
      Location.new(location.x_unit - 1, location.y_unit, location.table)
    rescue ValidationError
      location
    end

    def east_from(location)
      Location.new(location.x_unit + 1, location.y_unit, location.table)
    rescue ValidationError
      location
    end
  end
end

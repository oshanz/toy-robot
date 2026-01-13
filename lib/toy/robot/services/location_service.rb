# frozen_string_literal: true

class LocationService
  def self.goto_next(location, direction)
    method = direction.report.downcase
    send("#{method}_from", location)
  end

  class << self
    private

    def north_from(location)
      location.y_unit += 1
    end

    def south_from(location)
      location.y_unit -= 1
    end

    def west_from(location)
      location.x_unit -= 1
    end

    def east_from(location)
      location.x_unit += 1
    end
  end
end

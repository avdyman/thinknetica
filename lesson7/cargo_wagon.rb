# frozen_string_literal: true

require_relative 'wagon'

class CargoWagon < Wagon
  def loaded_wagon(volume)
    if volume < @places_count
      @loaded_place += volume
      # p "Occupied volume #{volume}, left #{self.free_volume}"
    else
      p 'No free volume in this wagon'
    end
  end
end

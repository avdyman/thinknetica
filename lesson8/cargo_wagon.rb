# frozen_string_literal: true

require_relative 'wagon'
# This is subclass
class CargoWagon < Wagon
  def loaded_wagon(volume)
    if volume < @places_count
      @loaded_place += volume
      p "Occupied volume #{occupied_places}, left #{free_places}"
    else
      p 'No free volume in this wagon'
    end
  end
end

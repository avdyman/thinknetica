# frozen_string_literal: true

require_relative 'wagon'
# This is subclass
class PassengerWagon < Wagon
  def loaded_wagon
    if @loaded_place < @places_count
      @loaded_place += 1
      p "Occupied place #{occupied_places}, left #{free_places}"
    else
      p 'No free places in this wagon'
    end
  end
end

# frozen_string_literal: true

require_relative 'wagon'

class PassengerWagon < Wagon
  def loaded_wagon
    if @loaded_place < @places_count
      @loaded_place += 1
      # p "Occupied place #{place}, left #{self.free_places}"
    else
      p 'No free places in this wagon'
    end
  end
end

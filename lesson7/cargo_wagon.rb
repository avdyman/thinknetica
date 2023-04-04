# frozen_string_literal: true

require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :wagon_volume

  def initialize(wagon_volume)
    @wagon_volume = wagon_volume
    @loaded_volume = 0
  end

  def loaded_wagon(_volume)
    if @loaded_volume < @wagon_volume
      @loaded_volume += 1
      # p "Occupied volume #{volume}, left #{self.free_volume}"
    else
      p 'No free volume in this wagon'
    end
  end

  def occupied_volume
    @loaded_volume
  end

  def free_volume
    @wagon_volume - @loaded_volume
  end
end

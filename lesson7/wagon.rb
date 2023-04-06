# frozen_string_literal: true

require_relative 'manufacturer'

class Wagon
  include Manufacturer

  def initialize(places_count)
    @places_count = places_count
    @loaded_place = 0
  end

  def loaded_wagon
    raise 'No impleted'
  end

  def occupied_places
    @loaded_place
  end

  def free_places
    @places_count - @loaded_place
  end

  def capacity
    occupied_places + free_places
  end
end

# frozen_string_literal: true

# require_relative 'wagon'

# class PassengerWagon < Wagon

#   attr_reader :places_count

#   def initialize(places_count)
#     @places_count = places_count
#     @loaded = 0
#   end

#   def loaded_place(place)
#     if @loaded < @places_count
#       @loaded += 1
#       p "Occupied place #{place}, left #{self.free_places}"
#     else
#       p "No free places in this wagon"
#     end
#   end

#   def occupied_places
#     @loaded
#   end

#   def free_places
#     @places_count - @loaded
#   end

# end
require_relative 'wagon'

class PassengerWagon < Wagon
  attr_reader :places_count

  def initialize(places_count)
    @places_count = places_count
    @loaded_place = 0
  end

  def loaded_wagon(_place)
    if @loaded_place < @places_count
      @loaded_place += 1
      # p "Occupied place #{place}, left #{self.free_places}"
    else
      p 'No free places in this wagon'
    end
  end

  def occupied_places
    @loaded_place
  end

  def free_places
    @places_count - @loaded_place
  end
end

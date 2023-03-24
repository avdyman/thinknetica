# frozen_string_literal: true

require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :type

  def cargo_wagon
    super
    @type = :cargo
  end
end

# p "CW manufacturer"
# cw1 = CargoWagon.new
# cw1.set_manufacturer("ABC")
# p cw1

# cw2 = CargoWagon.new
# cw2.set_manufacturer("DCA")
# p cw2

# cw3 = CargoWagon.new
# cw3.set_manufacturer("ABC")
# p cw3

# cw4 = CargoWagon.new
# cw4.set_manufacturer("DCA")
# p cw4

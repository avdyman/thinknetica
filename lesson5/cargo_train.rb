# frozen_string_literal: true

require_relative 'train'
require_relative 'manufacturer'

class CargoTrain < Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number

  def initialize(number)
    @number = number
    @@trains[number] = self

    register_instance
  end

  def add_wagon(wagon)
    return unless @speed.zero?
    return unless wagon.instance_of?(CargoWagon)

    @wagons << wagon
  end
end

# p "CT manufacturer"
# ct1 = CargoTrain.new(444)
# ct1.set_manufacturer("ABC")
# p ct1
# ct2 = CargoTrain.new(555)
# ct2.set_manufacturer("DCA")
# p ct2
# p CargoTrain.count_instances

# p "train 111 find nil"
# p Train.find(111)
# p "train 555 find"
# p Train.find(555)

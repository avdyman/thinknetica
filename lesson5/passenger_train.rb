# frozen_string_literal: true

require_relative 'train'
require_relative 'manufacturer'
require 'pry'

class PassengerTrain < Train
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
    return unless wagon.instance_of?(PassengerWagon)

    @wagons << wagon
  end
end

# p "PT manufacturer"
# pt1 = PassengerTrain.new(111)
# pt1.set_manufacturer("ABC")
# p pt1
# pt2 = PassengerTrain.new(222)
# pt2.set_manufacturer("DSA")
# p pt2
# pt3 = PassengerTrain.new(333)
# pt3.set_manufacturer("ABC")
# p pt3
# p PassengerTrain.count_instances

# p "train 111 find"
# p Train.find(111)
# p "train 555 find nil"
# p Train.find(555)

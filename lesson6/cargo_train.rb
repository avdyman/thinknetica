# frozen_string_literal: true

require_relative 'train'
require_relative 'manufacturer'

class CargoTrain < Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number

  TRAIN_NUMBER = /^[a-z\d]{3} *[a-z\d]{2}$/i.freeze

  def initialize(number)
    @number = number
    validate!
    @@trains[number] = self

    register_instance
  end

  def add_wagon(wagon)
    return unless @speed.zero?
    return unless wagon.instance_of?(CargoWagon)

    @wagons << wagon
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  def validate!
    raise 'Train number empty' if number.nil? || number.length.to_i.zero?
    raise 'Uncorrect format of train number' if number[:number] !~ TRAIN_NUMBER
  end
end

# p tr1 = CargoTrain.new("123 45")
# p tr1.valid?
# p tr2 = CargoTrain.new("12c b1")
# p tr2.valid?
# p tr3 = CargoTrain.new("123 456")
# p tr3.valid?

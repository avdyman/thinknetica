# frozen_string_literal: true

require_relative 'train'
require_relative 'manufacturer'
require 'pry'

class PassengerTrain < Train
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
    return unless wagon.instance_of?(PassengerWagon)

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
    raise ArgumentError, 'Train number empty' if number.nil? || number.length.to_i.zero?
    raise ArgumentError, 'Uncorrect format number' if number[:number] !~ TRAIN_NUMBER
  end
end

# p tr3 = PassengerTrain.new("123 45")
# p tr3.valid?
# p tr4 = PassengerTrain.new("12c b1")
# p tr4.valid?
# p tr2 = PassengerTrain.new("bbb 2x")
# p tr2.valid?
# p tr1 = PassengerTrain.new("bbbff 2xs")

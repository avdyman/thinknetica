# frozen_string_literal: true

require_relative 'train'
# require_relative 'station'
require_relative 'manufacturer'
# This is subclass
class CargoTrain < Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number

  # TRAIN_NUMBER = /^[a-z\d]{3} *[a-z\d]{2}$/i.freeze

  def initialize(number)
    super
    validate!
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
    raise 'Uncorrect format of train number' if number !~ TRAIN_NUMBER
  end
end

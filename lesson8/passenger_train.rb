# frozen_string_literal: true

require_relative 'train'
# require_relative 'station'
require_relative 'manufacturer'
require 'pry'
# This is subclass
class PassengerTrain < Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number

  TRAIN_NUMBER = /^[a-z\d]{3} *[a-z\d]{2}$/i.freeze

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
    raise ArgumentError, 'Train number empty' if number.nil? || number.length.to_i.zero?
    raise ArgumentError, 'Uncorrect format number' if number !~ TRAIN_NUMBER
  end
end

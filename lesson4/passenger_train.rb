# frozen_string_literal: true

require_relative 'train'
require 'pry'

class PassengerTrain < Train
  def add_wagon(wagon)
    return unless @speed.zero?
    return unless wagon.instance_of?(PassengerWagon)

    @wagons << wagon
  end
end

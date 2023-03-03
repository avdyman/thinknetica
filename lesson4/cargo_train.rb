# frozen_string_literal: true

require_relative 'train'

class CargoTrain < Train
  def add_wagon(wagon)
    return unless @speed.zero?
    return unless wagon.instance_of?(CargoWagon)

    @wagons << wagon
  end
end

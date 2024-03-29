# frozen_string_literal: true

# В классе Train создать метод класса find, который принимает номер поезда (указанный при его создании)
# и возвращает объект поезда по номеру или nil, если поезд с таким номером не найден.

# require_relative 'wagon'
# require_relative 'cargo_wagon'
# require_relative 'cargo_train'
# require_relative 'passenger_wagon'
# require_relative 'passenger_train'
require_relative 'manufacturer'
require_relative 'instance_counter'

require 'pry'

class Train
  include Manufacturer
  include InstanceCounter

  @@trains = {}

  attr_reader :number, :speed, :wagons, :current_station

  def initialize(number)
    @number = number
    @speed = 0
    @route = nil
    @current_station = nil
    @wagons = []
    @@trains[number] = self

    register_instance
  end

  def speed_up(speed)
    @speed += speed
  end

  def speed_down(speed)
    return if speed <= 0
    return @speed = 0 if @speed - speed <= 0

    @speed -= speed
  end

  def add_wagon(wagon)
    return unless @speed.zero?

    if instance_of?(PassengerTrain)
      @wagons << wagon if wagon.instance_of?(PassengerWagon)
    elsif instance_of?(CargoTrain)
      @wagons << wagon if wagon.instance_of?(CargoWagon)
    else
      p 'Unknown type train'
    end
  end

  def delete_wagon
    return unless @speed.zero?

    @wagons.delete(wagon)
  end

  def set_route(route)
    @route = route
    @current_station = route.stations.first
  end

  def go_next_station
    @current_station.trains.delete(self)
    @current_station = @route.stations[current_station_index + 1]
    @current_station.add_train(self)
  end

  def go_prev_station
    @current_station = @route.stations[current_station_index - 1]
  end

  def show_prev_station
    @route.stations[current_station_index - 1]
  end

  def show_nex_station
    @route.stations[current_station_index + 1]
  end

  private

  def current_station_index
    @route.stations.index(@current_station)
  end

  def self.find(number)
    @@trains[number]
  end
end

# p "dont upcount instances of base class"
# p Train.count_instances

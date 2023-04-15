# frozen_string_literal: true

# В классе Station (жд станция) создать метод класса all, который возвращает все станции (объекты),
# созданные на данный момент

require 'pry'
require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@stations = []

  class << self
    def all
      @@stations
    end
  end

  def initialize(name, trains = [])
    @name = name
    @trains = trains
    @@stations << self

    register_instance
  end

  def add_train(train)
    @trains << train
  end

  def departure(train)
    return unless @trains.include?(train)

    @trains.delete(train)
    train.go_next_station
  end

  def show_trains(type = nil)
    if type
      @trains.filter { |train| train.type == type }
    else
      @trains.map(&:number)
    end
  end
end

# st1 = Station.new("STN1")
# st2 = Station.new("STN2")
# p Station.all
# p "now created 2"

# st3 = Station.new("STN3")
# st4 = Station.new("STN4")
# p Station.all
# p "now created 4"

# p "instances"
# p Station.count_instances

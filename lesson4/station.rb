# frozen_string_literal: true

require 'pry'

class Station
  attr_reader :name, :trains

  def initialize(name, trains = [])
    @name = name
    @trains = trains
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

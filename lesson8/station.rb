# frozen_string_literal: true

require 'pry'
require_relative 'instance_counter'
# This is main class
class Station
  include InstanceCounter
  attr_reader :name, :trains

  # STATION_NAME = /^[a-z\d]{5}$/i.freeze

  class << self
    def all
      @@stations
    end
  end

  def initialize(name, trains = [])
    @name = name
    @trains = trains
    @stations = []
    validate!

    register_instance
  end

  def add_train(train)
    @trains << train
  end

  def departure(train)
    return unless @trains.include?(train)

    @trains.delete(train)
  end

  def show_trains(type = nil)
    if type
      @trains.filter { |train| train.type == type }
    else
      @trains.map(&:number)
    end
  end

  def trains_each(&block)
    @trains.each_with_index(&block)
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  def validate!
    raise ArgumentError, 'Uncorrect format name' if name !~ STATION_NAME
  end
end

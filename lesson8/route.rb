# frozen_string_literal: true

require_relative 'instance_counter'
# This is main class
class Route
  include InstanceCounter
  attr_reader :name, :stations

  # ROUTE_NAME = /^[a-z\d]{6}$/i.freeze

  def initialize(name, first_station, finish_station)
    @name = name
    @stations = [first_station, finish_station]
    validate!

    register_instance
  end

  def add_stations(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station) unless [@stations.first, @stations.last].include?(station)
  end

  def all_stations
    @stations.map(&:name)
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  def validate!
    raise ArgumentError, 'Uncorrect format name' if name !~ ROUTE_NAME
    raise ArgumentError, 'Route name empty' if name.nil?
  end
end

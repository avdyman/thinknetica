# frozen_string_literal: true

require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_reader :name, :stations

  def initialize(name, first_station, finish_station)
    @name = name
    @stations = [first_station, finish_station]

    register_instance
  end

  def add_stations(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station) unless [@stations.first, @stations.last].include?(station)
  end

  def all_stations
    # @stations.map { |station| station.name }
    @stations.map(&:name)
  end
end

# p rt1 = Route.new("RT1", 0, 3)
# p rt2 = Route.new("RT2", 3, 0)

# p Route.count_instances

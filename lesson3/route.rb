class Route
  attr_reader :stations

  def initialize(first_station, finish_station)
    @stations = [first_station, finish_station]
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

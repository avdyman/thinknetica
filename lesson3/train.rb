require 'pry'

class Train
    attr_reader :number, :speed, :type, :wagon_count, :current_station

    TYPE = [:passanger, :cargo].freeze
    
    def initialize(number:, type:, wagon_count:)
    # def initialize(number, type, wagon_count)
      @number = number
      @type = type
      @wagon_count = wagon_count
      @speed = 0
      @route = nil
      @current_station = nil

      validate!
    end

    def speed_up(speed)
      @speed += speed
    end

    def speed_down(speed)
      return if speed <= 0
      return @speed = 0 if @speed - speed <= 0

      @speed -= speed
    end

    def add_wagon
      @wagon_count += 1 unless @speed == 0
    end

    def delete_wagon
      @wagon_count -= 1 unless @wagon_count <= 0 && @speed == 0
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

    def validate!
      raise ArgumentError.new("Type should be passenger or cargo") unless TYPE.include?(@type)
    end
end

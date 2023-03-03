# frozen_string_literal: true

require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'passenger_train'
require_relative 'cargo_train'

require 'pry'

class Main
  def initialize
    @station_list = []
    @train_list = []
    @route_list = []
    @wagon_list = []
  end

  def actions
    p '0 - create station'
    p '1 - stations list'
    p '2 - create train'
    p '3 - create route'
    p '4 - add station to route'
    p '5 - delete station from route'
    p '6 - assign route to train'
    p '7 - create wagons'
    p '8 - add wagons to train'
    p '9 - delete wagons of train'
    p '10 - move the train forward and backward'
    p '11 - list trains on stations'
    p 'stop'
  end

  def display_route_list
    @route_list
  end

  def display_station_list
    @station_list
  end

  def display_train_list
    @train_list
  end

  def start
    while actions

      p 'make a choise'
      choise = gets.chomp.to_s

      case choise
      when 'stop'
        break
      when '0'
        p 'Name of the created station?'
        station_name = gets.chomp.to_s
        new_station = Station.new(name: station_name)
        p "New station #{station_name} was created"
        @station_list << new_station
      when '1'
        p @station_list.map(&:name)
      when '2'
        p 'Input number of the created train'
        number = gets.chomp.to_s
        p 'Input index type of train 1 - Passenger, 2 - Cargo'
        train_type = gets.chomp.to_i
        case train_type
        when 1
          @train_list << PassengerTrain.new(number: number)
          p "New train #{@train_list.last} was created"
          p @train_list
        when 2
          @train_list << CargoTrain.new(number: number)
          p "New train #{@train_list.last} was created"
          p @train_list
        else
          p "Last created train #{@train_list.last}"
          p 'Input: 1 - Passenger, 2 - Cargo, stop to exit'
        end
        @train_list.each { |train| puts "#{train.number} #{train.class.name}" }
      when '3'
        p 'Name of the new route?'
        name_route = gets.chomp.to_s
        p 'Input index of first station'
        first_station = @station_list[gets.chomp.to_i]
        p 'Input index of finish station'
        finish_station = @station_list[gets.chomp.to_i]
        @route_list << Route.new(name_route, first_station, finish_station)
        p "New route #{name_route} was created"
        p @route_list.map(&:name)
      when '4'
        p 'Choose the route'
        # p display_route_list
        p @route_list.map(&:name)
        route = @route_list[gets.chomp.to_i]
        p 'Input index of the additional station'
        additional_station = @station_list[gets.chomp.to_i]
        route.add_stations(additional_station)
        p route.all_stations
      when '5'
        p 'Choose the route'
        p @route_list.map(&:name)
        route = @route_list[gets.chomp.to_i]
        p 'Input index of the delete station'
        del_station = @station_list[gets.chomp.to_i]
        route.delete_station(del_station)
        p route.all_stations
      when '6'
        p 'Choose the train'
        train = @train_list[gets.chomp.to_i]
        p 'Choose the route'
        route = @route_list[gets.chomp.to_i]
        train.set_route(route)
        p "Current train #{train}"
        p train
      when '7'
        p 'Input index type of wagon 1 - Passenger, 2 - Cargo'
        wagon_type = gets.chomp.to_i
        case wagon_type
        when 1
          @wagon_list << PassengerWagon.new
          p "New wagon #{@wagon_list} was created"
        when 2
          @wagon_list << CargoWagon.new
          p "New wagon #{@wagon_list} was created"
        else
          p 'Input: 1 - Passenger, 2 - Cargo or stop to exit'
        end
        p @wagon_list
      when '8'
        p 'Choose the index of train'
        display_train_list
        train = @train_list[gets.chomp.to_i]
        p @wagon_list
        p 'Choose the wagon'
        wagon = @wagon_list[gets.chomp.to_i]
        train.add_wagon(wagon)
        @wagon_list.delete(wagon) if @wagon_list.include?(wagon)
        p "Train Composition #{train}"
        p @train_list
        p @wagon_list
      when '9'
        p 'Choose the index of train'
        display_train_list
        train = @train_list[gets.chomp.to_i]
        p 'Choose the wagon'
        # binding.pry
        wagon_index = @train_list.last.wagons[gets.chomp.to_i]
        @train_list.last.wagons.delete(wagon_index)
        p @train_list
      when '10'
        p 'Choose the index of train'
        display_train_list
        train = @train_list[gets.chomp.to_i]
        # train.go_next_station
        p 'Input index for move: 1 - next station, 2 - prew station'
        index_move = gets.chomp.to_i
        case index_move
        when 1
          train.go_next_station
        when 2
          train.go_prev_station
        end
        p train.current_station
        p @route_list
      when '11'
        # @station_list.each {|station| puts "#{station.name}"}
        p 'Station and trains'
        @station_list.filter { |station| puts "#{station.name} #{station.show_trains}" }
      end
    end
  end
end

main = Main.new
main.start

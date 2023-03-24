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
    loop do
      p 'make a choise'
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

      choise = gets.chomp.to_s
      break if choise == 'stop'

      set_choise(choise)
    end
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

  def set_choise(choise)
    case choise
    when '0'
      create_station
    when '1'
      station_list
    when '2'
      create_train
    when '3'
      create_route
    when '4'
      add_station_to_route
    when '5'
      delete_station_from_route
    when '6'
      assign_route_to_train
    when '7'
      create_wagons
    when '8'
      add_wagons_to_train
    when '9'
      delete_wagons_of_train
    when '10'
      move_the_train
    when '11'
      list_trains_on_stations
    end
  end

  def create_station
    p 'Name of the created station?'
    station_name = gets.chomp.to_s
    new_station = Station.new(name: station_name)
    p "New station #{station_name} was created"
    @station_list << new_station
  end

  def station_list
    p @station_list.map(&:name)
  end

  def create_train
    attempt = 0
    begin
      p 'Input number of the created train'
      number = gets.chomp.to_s
      p 'Input index type of train 1 - Passenger, 2 - Cargo'
      train_type = gets.chomp.to_i
      case train_type
      when 1
        @train_list << PassengerTrain.new(number: number)
        p "New #{@train_list.last.number[:number]} #{@train_list.last.class.name} was created"
      when 2
        @train_list << CargoTrain.new(number: number)
        p "New #{@train_list.last.number[:number]} #{@train_list.last.class.name} was created"
      else
        p "Last created train #{@train_list.last}"
        p 'Input: 1 - Passenger, 2 - Cargo, stop to exit'
      end
    rescue StandardError => e
      attempt += 1
      p "Error create: #{e.message} Try again format - [][][] [][] - use integers or letters"
      retry if attempt < 3
    ensure
      p "Was #{attempt} input errors." if attempt.positive?
    end
  end

  def create_route
    p 'Name of the new route?'
    name_route = gets.chomp.to_s
    p 'Input index of first station'
    first_station = @station_list[gets.chomp.to_i]
    p 'Input index of finish station'
    finish_station = @station_list[gets.chomp.to_i]
    @route_list << Route.new(name_route, first_station, finish_station)
    p "New route #{name_route} was created"
  end

  def add_station_to_route
    p 'Choose the route'
    p @route_list.map(&:name)
    route = @route_list[gets.chomp.to_i]
    p 'Input index of the additional station'
    additional_station = @station_list[gets.chomp.to_i]
    route.add_stations(additional_station)
  end

  def delete_station_from_route
    p 'Choose the route'
    p @route_list.map(&:name)
    route = @route_list[gets.chomp.to_i]
    p 'Input index of the delete station'
    del_station = @station_list[gets.chomp.to_i]
    route.delete_station(del_station)
  end

  def assign_route_to_train
    p 'Choose the train'
    train = @train_list[gets.chomp.to_i]
    p 'Choose the route'
    route = @route_list[gets.chomp.to_i]
    train.set_route(route)
    p "Current train #{train}"
  end

  def create_wagons
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
  end

  def add_wagons_to_train
    p 'Choose the index of train'
    display_train_list
    train = @train_list[gets.chomp.to_i]
    p @wagon_list
    p 'Choose the wagon'
    wagon = @wagon_list[gets.chomp.to_i]
    train.add_wagon(wagon)
    @wagon_list.delete(wagon) if @wagon_list.include?(wagon)
    p "Train Composition #{train}"
  end

  def delete_wagons_of_train
    p 'Choose the index of train'
    display_train_list
    train = @train_list[gets.chomp.to_i]
    p 'Choose the wagon'
    wagon_index = @train_list.last.wagons[gets.chomp.to_i]
    @train_list.last.wagons.delete(wagon_index)
  end

  def move_the_train
    p 'Choose the index of train'
    display_train_list
    train = @train_list[gets.chomp.to_i]
    p 'Input index for move: 1 - next station, 2 - prew station'
    index_move = gets.chomp.to_i
    case index_move
    when 1
      train.go_next_station
    when 2
      train.go_prev_station
    end
    p train.current_station
  end

  def list_trains_on_stations
    p 'Station and trains'
    @station_list.filter { |station| puts "#{station.name} #{station.show_trains}" }
  end
end

main = Main.new
main.actions

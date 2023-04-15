# frozen_string_literal: true

require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'displays'
require_relative 'constant'

require 'pry'
# This is main programm class
class Main
  include Displays

  def initialize
    @station_list = []
    @train_list = []
    @route_list = []
    @wagon_list = []
  end

  def actions
    loop do
      puts File.read('menu.txt')
      choise = gets.to_i
      break if choise == 13

      send(choises(choise))
    end
  end

  def choises(chs)
    CHOISE_ACTION[chs].to_s
  end

  def create_station
    p 'Name of the created station?'
    name = gets.chomp.to_s.capitalize
    @station_list << Station.new(name)
  end

  def create_train
    p 'Input Number of the create train 5 symbols and type 1 - Passenger, 2 - Cargo'
    number = gets.chomp.to_s.capitalize
    train_type = gets.chomp.to_i
    train = train_type == 1 ? PassengerTrain.new(number) : CargoTrain.new(number)
    @train_list.push(train)
    train_info(train)
  rescue StandardError => e
    p "Error create: #{e.message} Try again format - [][][] [][] - use integers or letters"
  end

  def create_route
    p 'Name of the new Route, index First and Last station'
    name_route = gets.chomp.to_s.capitalize
    first_station = @station_list[gets.chomp.to_i]
    finish_station = @station_list[gets.chomp.to_i]
    puts @route_list << Route.new(name_route, first_station, finish_station)
  end

  def add_station_to_route
    route = choose_route
    station = choose_station
    p route.add_stations(station)
  end

  def delete_station_from_route
    route = choose_route
    station = choose_station
    p "Station #{route.delete_station(station)} was delete"
  end

  def assign_route_to_train
    train = choose_train
    p 'Choose the route'
    route = @route_list[gets.chomp.to_i]
    p "Train at station #{train.add_route(route)} route #{route.name}"
  end

  def create_wagons
    p 'Choose type wagon 1 - Passenger(Places count), 2 - Cargo(Wagon volume)'
    wagon_type = gets.chomp.to_i
    if wagon_type == 2
      wagon_volume = gets.chomp.to_i
      p @wagon_list << CargoWagon.new(wagon_volume)
    else
      places_count = gets.chomp.to_i
      p @wagon_list << PassengerWagon.new(places_count)
    end
  end

  def add_wagons_to_train
    train = choose_train
    wagon = choose_wagon
    train.add_wagon(wagon)
    @wagon_list.delete(wagon) if @wagon_list.include?(wagon)
  end

  def delete_wagons_of_train
    wagon = choose_train_wagon
    train.wagons.delete(wagon)
    train_wagon_each
    @wagon_list << wagon unless @wagon_list.include?(wagon)
  end

  def move_the_train
    train = choose_train
    p 'Input index for move: 1 - next station, 2 - prew station'
    index_move = gets.chomp.to_i
    index_move == 1 ? train.go_next_station : train.go_prev_station
  end

  def list_trains_on_stations
    station = choose_station
    station.trains_each { |train, _id| p "At station: #{station.name} trains: #{train.number}" }
  end

  def wagon_loading
    wagon = choose_train_wagon
    if wagon.instance_of?(PassengerWagon)
      wagon.loaded_wagon
    else
      wagon.instance_of?(CargoWagon)
      p 'Choose the volume'
      volume = gets.chomp.to_i
      wagon.loaded_wagon(volume)
    end
  end
end

main = Main.new
main.actions

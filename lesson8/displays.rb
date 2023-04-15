# frozen_string_literal: true

# This is module
module Displays
  def display_route_list
    @route_list
  end

  def display_station_list
    @station_list
  end

  def display_train_list
    @train_list
  end

  def display_wagon_list
    @wagon_list
  end

  def train_info(train)
    p "#{train.class.name}, number: #{train.number}, wagons: #{train.wagons}"
  end

  def choose_train
    p 'Choose the index of train'
    @train_list[gets.chomp.to_i]
  end

  def choose_route
    p 'Choose the route'
    @route_list[gets.chomp.to_i]
  end

  def choose_station
    p 'Choose the station'
    @station_list[gets.chomp.to_i]
  end

  def station_list
    puts @station_list.map(&:name)
  end

  def choose_train_wagon
    train = choose_train
    p "Choose the wagon: #{train.wagons}"
    train.wagons[gets.chomp.to_i]
  end

  def choose_wagon
    p "Choose the wagon #{display_wagon_list}"
    @wagon_list[gets.chomp.to_i]
  end
end

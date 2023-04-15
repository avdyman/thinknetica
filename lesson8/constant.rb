# frozen_string_literal: true

CHOISE_ACTION = {
  0 => 'create_station', 1 => 'station_list', 2 => 'create_train', 3 => 'create_route', 4 => 'add_station_to_route',
  5 => 'delete_station_from_route', 6 => 'assign_route_to_train', 7 => 'create_wagons', 8 => 'add_wagons_to_train',
  9 => 'delete_wagons_of_train', 10 => 'move_the_train', 11 => 'list_trains_on_stations', 12 => 'wagon_loading'
}.freeze

TRAIN_NUMBER = /^[a-z\d]{3} *[a-z\d]{2}$/i.freeze

STATION_NAME = /^[a-z\d]{5}$/i.freeze

ROUTE_NAME = /^[a-z\d]{6}$/i.freeze

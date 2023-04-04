# frozen_string_literal: true

require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'passenger_train'
require_relative 'cargo_train'

t1 = PassengerTrain.new('KYIV1')
t2 = CargoTrain.new('KYIV2')
t3 = PassengerTrain.new('KYIV3')
pw1 = PassengerWagon.new(46)
pw2 = PassengerWagon.new(52)
pw3 = PassengerWagon.new(64)
pw4 = PassengerWagon.new(72)
pw5 = CargoWagon.new(100)
pw6 = CargoWagon.new(200)
t1.add_wagon(pw1)
t1.add_wagon(pw2)
t3.add_wagon(pw3)
t3.add_wagon(pw4)
t2.add_wagon(pw5)
t2.add_wagon(pw6)
p '_________________________________'
p "Wagons train: #{t1.number}"
t1.wagons_each { |wagon, id| p "wagon:#{wagon.class.name} ID #{id}" }
p "Wagons train: #{t2.number}"
t2.wagons_each { |wagon, id| p "wagon:#{wagon.class.name} ID #{id}" }
p "Wagons train: #{t3.number}"
t3.wagons_each { |wagon, id| p "wagon:#{wagon.class.name} ID #{id}" }
p '_________________________________'
pw1.loaded_wagon(1)
pw1.loaded_wagon(1)
pw1.loaded_wagon(1)
p "Wagon #{pw1} places_count: #{pw1.places_count} occupied places: #{pw1.occupied_places} free places: #{pw1.free_places}"
pw2.loaded_wagon(1)
pw2.loaded_wagon(1)
pw3.loaded_wagon(1)
pw4.loaded_wagon(1)
pw5.loaded_wagon(1)
pw5.loaded_wagon(1)
pw5.loaded_wagon(1)
pw5.loaded_wagon(1)
pw5.loaded_wagon(1)
pw6.loaded_wagon(1)
pw6.loaded_wagon(1)
pw6.loaded_wagon(1)
pw6.loaded_wagon(1)
pw6.loaded_wagon(1)
pw6.loaded_wagon(1)
pw6.loaded_wagon(1)
p "Wagon #{pw6} wagon_volume: #{pw6.wagon_volume} occupied volume: #{pw6.occupied_volume} free volume: #{pw6.free_volume}"
st1 = Station.new('PEACE')
st2 = Station.new('NOWAR')
st3 = Station.new('CHOMP')
st2.add_train(t1)
st3.add_train(t2)
st2.add_train(t3)
p '_________________________________'
p "Trains on station #{st2.name}:"
st2.trains_each { |train, id| p "train: #{train.class.name} #{train.number} #{id}" }
p "Trains on station #{st3.name}:"
st3.trains_each { |train, id| p "train: #{train.class.name} #{train.number} #{id}" }
p '_________________________________'
p "#{t1.class.name} #{t2.number} wagons: #{t2.wagons}"
p '_________________________________'
p "#{t2.class.name} #{t2.number} wagons: #{t2.wagons}"
p '_________________________________'
p "#{t3.class.name} #{t3.number} wagons: #{t3.wagons}"

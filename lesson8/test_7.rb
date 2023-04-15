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
pw7 = PassengerWagon.new(82)
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
pw1.loaded_wagon
pw1.loaded_wagon
pw1.loaded_wagon
p "Wagon #{pw1} places_count: #{pw1.capacity} occupied places: #{pw1.occupied_places} free places: #{pw1.free_places}"
pw2.loaded_wagon
pw2.loaded_wagon
pw3.loaded_wagon
pw4.loaded_wagon
pw5.loaded_wagon(11)
pw5.loaded_wagon(4)
pw5.loaded_wagon(14)
pw5.loaded_wagon(5)
pw5.loaded_wagon(3)
pw6.loaded_wagon(12)
pw6.loaded_wagon(1)
pw6.loaded_wagon(24)
pw6.loaded_wagon(2)
pw6.loaded_wagon(8)
pw6.loaded_wagon(32)
pw6.loaded_wagon(7)
p "Wagon #{pw6} wagon_volume: #{pw6.capacity} occupied volume: #{pw6.occupied_places} free volume: #{pw6.free_places}"
# st1 = Station.new('PEACE')
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
p '================================='
t1.speed_up(20)
p t1.speed

t1.speed_down(30)
p t1.speed

t1.add_wagon(pw7)
p t1.wagons

t1.speed_down(10)
p t1.speed
t1.add_wagon(pw7)
p t1.wagons

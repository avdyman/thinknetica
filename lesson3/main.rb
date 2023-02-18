require_relative 'route'
require_relative 'station'
require_relative 'train'

s1 = Station.new(name: "st 1")
s2 = Station.new(name: "st 2")
s3 = Station.new(name: "st 3")
s4 = Station.new(name: "st 4")
s5 = Station.new(name: "st 5")


t1 = Train.new(type: :cargo, wagon_count: 12, number: "111")
t2 = Train.new(type: :cargo, wagon_count: 12, number: "222")
t3 = Train.new(type: :passanger, wagon_count: 2, number: "333")
t4 = Train.new(type: :passanger, wagon_count: 3, number: "444")
t5 = Train.new(type: :cargo, wagon_count: 182, number: "555")
t6 = Train.new(type: :cargo, wagon_count: 121, number: "2")
t7 = Train.new(type: :cargo, wagon_count: 120, number: "22")
t8 = Train.new(type: :passanger, wagon_count: 27, number: "33")
t9 = Train.new(type: :passanger, wagon_count: 34, number: "44")
t10 = Train.new(type: :cargo, wagon_count: 150, number: "55")

s1.add_train(t1)
s1.add_train(t9)
s1.add_train(t2)
s2.add_train(t3)
s2.add_train(t4)
s3.add_train(t5)
s3.add_train(t6)
s3.add_train(t7)
s4.add_train(t8)
s5.add_train(t10)

r1 = Route.new(s1, s5)
r1.add_stations(s4)
r1.add_stations(s2)

r2 = Route.new(s2, s4)
r2.add_stations(s3)

r3 = Route.new(s5, s2)
r3.add_stations(s3)
r3.add_stations(s4)

r4 = Route.new(s1, s4)

t1.set_route(r1)


p r1.all_stations

p t1.current_station.name
p s1.show_trains
p s4.show_trains
p s2.show_trains

t1.go_next_station
p t1.current_station.name
p s1.show_trains
p s4.show_trains
p s2.show_trains

s4.departure(t1)
p t1.current_station.name
p s1.show_trains
p s4.show_trains
p s2.show_trains

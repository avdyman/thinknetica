require 'pry'

class Station
  attr_reader :name, :trains
 
  def initialize(name, trains=[])
    @name = name
    @trains = trains
     
  end

  def add_train(train)
    @trains << train
  end
  
  def departure(train)
    # binding.pry
    if @trains.include?(train)
      # binding.pry

      @trains.delete(train)
      train.go_next_station
    end
  end

  def show_trains(type=nil)
    if type
      @trains.filter { |train| train.type == type }
    else
      @trains.map(&:number)
    end

  end  

  
end

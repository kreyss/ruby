class Station
  attr_reader :name, :trains
  def initialize(name)
    @name = name
    @trains = []
    puts "Создали станцию #{name}"
  end

  def get_train(train)
    trains << train 
    puts "на станцию #{name} прибыл поезд № #{train.number}"
  end

  def send_train(train)
    trains.delete(train)
    train.station = nil
    puts "Со станции #{name} отправился поезд № #{train.number}"
  end

  def show_trains(type = nil)
    if type
      puts "Поезда на станции#{name} типо #{type}"
      trains.each{|train| puts train.number if train.type == type}
    else 
      puts "Поезда на станции#{name}"
      trains.each{|train| puts train.number}
    end
  end
end

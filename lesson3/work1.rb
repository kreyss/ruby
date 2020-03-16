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
      trains.each{ |train| puts train.number if train.type == type }
    else 
      puts "Поезда на станции#{name}"
      trains.each{ |train| puts train.number }
    end
  end
end
class Route 
  attr_accessor :stations, :from, :to
  
  def initialize(from, to)
    @stations = [from, to]
    puts "Создан маршрут #{from.name} - #{to.name}"
  end
  def add_station(station)
    self.stations.insert(-2, station)
    puts "к маршруту #{stations.first.name} до #{stations.last.name} добавлена станция #{station.name}"
  end

  def remove_station(station)
    if [stations.first, stations.last].include?(station)
      puts "Первую и последнюю станцию не можно удалять"
    else 
      self.stations.delete(station)
      puts "Из маршрута #{stations.first.name} до #{stations.last.name} удалена #{station.name}"
    end
  end
    def show_stations
      puts "в маршруте #{stations.first.name} до #{stations.last.name} станции"
      stations.each { |station| puts "#{station.name}" }
    end
  end
class Train
  attr_accessor :speed, :number, :car_count, :route, :station
  attr_reader :type

  def initialize(number, type, car_count)
    @number = number
    @type = type
    @car_count = car_count
    @speed = 0
    puts "Создан поезд #{number}. Тип #{type}. Количество вагонов #{car_count}"
  end
  def stop
    self.speed = 0
  end

  def add_car
    if speed.zero?
      self.car_count += 1
      puts "К поезду #{number} добавили вагон. Теперь их #{car_count}"
      else
        puts "На ходу прицеплять вагон нельзя"
      end
  end
  def remove_car
    if car_count.zero?
      puts "Вагонов уже не осталось"
    elsif speed.zero?
      self.car_count -= 1
      puts "От поезда #{number} отцепили вагон. Теперь их #{car_count}"
    else 
      puts "На ходу отцепить вагон нельзя"
    end
  end
  def take_route(route)
    self.route = route
    puts "Поезд #{number} задан маршрут #{route.stations.first.name} до #{route.stations.last.name}"
  end
  def go_to(station)
    if route.nil?
      puts "Без маршрута поезд ехать не может"
    elsif @station == station
      puts "Поезд #{@number} уже на станции #{station.name}"
    elsif  route.stations.include?(station)
      @station.send_train(self) if @station
      @station = station
      station.get_train(self)
    else 
      puts "Станция #{station.name} не входит в маршрут поезда #{number}"
    end
  end
  def stations_around
    if route.nil?
      puts "маршрут не найден"
    else 
      station_index = route.stations.index(station)
      puts "сейчас поезд на#{station.name}"
      puts "Предыдущая станция #{route.stations[station_index - 1].name}" if station_index != 0
      puts "Следующая станция#{route.stations[station_index + 1].name}" if station_index != route.stations.size - 1
    end
  end
end

station_st1 = Station.new("Бульвар Рокоссовского")
station_st2 = Station.new("Черкизовская")
station_st3 = Station.new("Преображенская площадь")
station_st4 = Station.new("Сокольники")
station_st5 = Station.new("Красносельская")
station_st6 = Station.new("Комсомольская")
station_st7 = Station.new("Красные Ворота")

route_st1_sci = Route.new(station_st1, station_st6)
route_st1_sci.add_station(station_st4) 
route_st1_sci.add_station(station_st5)
route_st1_sci.show_stations
route_st1_sci.remove_station(station_st1)
route_st1_sci.remove_station(station_st6)
route_st1_sci.remove_station(station_st4)
route_st1_sci.show_stations

train1 = Train.new(1, "пассажир", 12)
train2 = Train.new(2, "грузовой", 23)
train3 = Train.new(3, "пассажир", 15)
train4 = Train.new(4, "грузовой", 19)

train1.take_route(route_st1_sci)
train1.go_to(station_st5)
train1.go_to(station_st6)

station_st5.show_trains
station_st6.show_trains

train1.go_to(station_st5)
train1.go_to(station_st6)

station_st5.get_train(train2)
station_st5.get_train(train3)
station_st5.get_train(train4)

station_st5.show_trains("пассажир")
station_st6.show_trains("грузовой")
train2.stations_around
train1.stations_around

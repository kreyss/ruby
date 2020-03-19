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
    puts "Первую и последнею старцию не можно удалять"
    else 
      self.stations.delete(station)
      puts "Из маршрута #{stations.first.name} до #{stations.last.name} удалена #{station.name}"
    end
  end
    def show_stations
      puts "в маршруте #{stations.first.name} до #{stations.last.name} станции"
      stations.each {|station| puts "#{station.name}"}
    end
  end
  
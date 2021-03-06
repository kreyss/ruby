require_relative 'instance_counter'
require_relative 'valid'
require_relative 'manufacturer'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'car'
require_relative 'cargo_train'
require_relative 'cargo_car'
require_relative 'passenger_train'
require_relative 'passenger_car'

CAR_TYPES = {'cargo' => CargoCar, 'passenger' => PassengerCar}

def create_station
  puts "C каким названием?"
  name = gets.chomp
  Station.new(name)
  puts "Построена станция #{name}"
rescue RuntimeError => e
  puts "Ошибка: #{e.message}"
  retry
end

def create_train
  puts "C каким номером?"
  number = gets.chomp
  raise "Поезд № #{number} уже существует" unless Train.find(number).nil?
  
  puts "1 - пассажирский, 2 - грузовой"
  choice = gets.chomp.to_i
  raise "Поезд не создан. Надо было ввести 1 или 2" unless [1, 2].include?(choice)

  case choice
  when 1
    PassengerTrain.new(number)
    puts "Создан пассажирский поезд №#{number}"
  when 2
    CargoTrain.new(number)
    puts "Создан грузовой поезд №#{number}"
  end
rescue RuntimeError => e
  puts "Ошибка: #{e.message}"
  retry
end

def add_car
  raise "Сначала необходимо создать поезд" if Train.all.empty?
  puts "К какому? (введите номер)"
  number = gets.chomp
  train = Train.find(number)
  raise "Поезда с таким номером нет" if train.nil?
  train.add_car(CAR_TYPES[train.type].new)
rescue RuntimeError => e
  puts "Ошибка: #{e.message}"
  retry unless Train.all.empty?
end

def remove_car
  raise "Сначала необходимо создать поезд" if Train.all.empty?
  puts "От какого? (введите номер)"
  number = gets.chomp
  train = Train.find(number)
  raise "Поезда с таким номером нет" if train.nil?
  raise "У этого поезда и так нет вагонов" if train.cars.empty?
  train.remove_car(train.cars.last)
rescue RuntimeError => e
  puts "Ошибка: #{e.message}"
end

def train_to_station
  raise "Сначала необходимо создать поезд" if Train.all.empty?
  raise "Сначала необходимо создать станцию" if Station.all.empty?
  puts "Какой поезд? (введите номер)"
  number = gets.chomp
  train = Train.find(number)
  raise "Поезда с таким номером нет" if train.nil?
  puts "На какую станцию? (название)"
  name = gets.chomp
  station = Station.all.detect{|station| station.name == name}
  raise "Такой станции нет" if station.nil?
  station.get_train(train)
rescue RuntimeError => e
  puts "Ошибка: #{e.message}"
end

def station_list
    raise "Станций еще не создано" if Station.instances.nil?
    puts "Список станций:"
    Station.all.each{|station| puts station.name}
rescue RuntimeError => e
  puts "Ошибка: #{e.message}"
end

def train_list
  raise "Сначала необходимо создать станцию" if Station.all.empty?
  puts "На какой? (название)"
  name = gets.chomp
  station = Station.all.detect{|station| station.name == name}
  raise "Такой станции нет" if station.nil?
  station.show_trains
rescue RuntimeError => e
  puts "Ошибка: #{e.message}"   
end

puts %Q(
0. Выход
1. Создать станцию
2. Создать поезд
3. Прицепить вагон к поезду
4. Отцепить вагон от поезда
5. Поместить поезд на станцию
6. Просмотреть список станций
7. Просмотреть список поездов на станции
  )
loop do
  print "Введите номер команды: "
  choice = gets.chomp.to_i

  case choice
  when 0
    puts "До новых встреч!"
    break
  when 1
    create_station
  when 2 
    create_train
  when 3 
    add_car
  when 4 
    remove_car
  when 5 
    train_to_station
  when 6 
    station_list
  when 7 
    train_list
  else
    puts "Необходимо выбрать один из предложенных вариантов"
  end
end

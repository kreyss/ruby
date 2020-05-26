# frozen_string_literal: true

class PassengerTrain < Train
  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER
  def initialize(number)
    super(number, 'passenger')
  end

  def add_car(car)
    raise 'К пассажирскому поезду можно прицеплять только пассажирские вагоны' unless car.instance_of?(PassengerCar)

    super(car)
  rescue RuntimeError => e
    puts "Ошибка: #{e.message}"
  end
end

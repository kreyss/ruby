# frozen_string_literal: true

class CargoTrain < Train
  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER
  def initialize(number)
    super(number, 'cargo')
  end

  def add_car(car)
    raise 'К грузовому поезду можно прицеплять только грузовые вагоны' unless car.instance_of?(CargoCar)

    super(car)
  rescue RuntimeError => e
    puts "Ошибка: #{e.message}"
  end
end

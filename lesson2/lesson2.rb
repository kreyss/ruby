puts "Введите основу"
foundation = gets.chomp

puts "Введите высоту"
height = gets.chomp


division = 1/2
area = 0.5*foundation.to_i*height.to_i

puts "площадь треугольника будет равна #{area.to_i}"
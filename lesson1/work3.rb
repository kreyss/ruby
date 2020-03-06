puts "Введите сторону a"
side_a = gets.chomp.to_i

puts "Введите сторону b"
side_b = gets.chomp.to_i

puts "Введите сторону c"
side_c = gets.chomp.to_i

#находит гипатенузу
if (side_a > side_b) && (side_a > side_c)
  cathet1 = side_b
  cathet2 = side_c
  hypotenuse = side_a
elsif (side_b > side_a) && (side_b > side_c)
  cathet1 = side_a
  cathet2 = side_c
  hypotenuse = side_b
else
  cathet1 = side_a
  cathet2 = side_b
  hypotenuse = side_c
end
#находит треугольник
if (hypotenuse**2) == (cathet1**2) + (cathet2**2)
 puts "Это правельный треугольник"

elsif (side_a == side_b) && (side_b != side_c) || (side_b == side_c) && (side_a != side_c) || (side_a == side_c) && (side_b != side_c)
  puts "Это равнобедренный треугольник"
elsif (side_a == side_b) && (side_b == side_c) && (side_a == side_c)
  puts "Равнобедренный равностороний треугольник"
else
  puts "это треугольник с разными сторонами "
end

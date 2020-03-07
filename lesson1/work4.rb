puts "первый коэффициент"
a = gets.chop.to_i

puts "второй коэффициент"
b = gets.chop.to_i

puts "третий коэффициент"
c = gets.chop.to_i

discriminant.to_f = Math.sqrt(b ** 2 - 4 * a * c)

if discriminant > 0 
  x1 = (-b + discriminant) / 2 * a
  x2 = (-b - discriminant) / 2 * a
  puts "дискриминант имеет два корня и это #{x1} , #{x2}"
elsif discriminant == 0 
  x1.to_f = -b / 2 * a
  puts "дискриминант имеет один корень и это #{x1}"
else 
  puts "дискриминант не имеет корней"
end

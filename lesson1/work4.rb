puts "первый коэффициент"
a = gets.chop.to_i

puts "второй коэффициент"
b = gets.chop.to_i

puts "третий коэффициент"
c = gets.chop.to_i

	discriminant = b**2 - 4 * a * c

if discriminant > 0 
	x1 = (-b + Math.sqrt(discriminant))/ 2*a
	x2 = (-b - Math.sqrt(discriminant))/ 2*a
	puts "дискриминант имеет два корня и это #{x1} , #{x2}"

elsif discriminant == 0 
	x1 = -b / 2*a
	puts "дискриминант имеет один корень и это #{x1}"

else 
puts "дискриминант не имеет корней"


end
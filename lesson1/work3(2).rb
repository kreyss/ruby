p "a"
a = gets.chomp.to_f

p "b"
b = gets.chomp.to_f

p "c"
c = gets.chomp.to_f

if c==Math.sqrt(a*a+b*b) || b==Math.sqrt(a*a+c*c) || a==Math.sqrt(c*c+b*b)
	p "треугольник прямоугольным"
elsif a.to_f==b.to_f && a.to_f==c.to_f && c.to_f==b.to_f
  puts "треугольник равностороний"
elsif a.to_f==b.to_f || b.to_f==c.to_f || c.to_f == a.to_f
  puts "треугольник равнобедренный"
else 
  puts "все стороны разные"
end

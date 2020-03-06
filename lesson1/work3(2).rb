p "a"
a = gets.chomp.to_f

p "b"
b = gets.chomp.to_f

#p "c"
#c = gets.chomp.to_f


c=a**2+b**2
c=Math.sqrt(c)

if (a>b)&&(a>b)
	cathet1 = b
	cathet2 = c
	hypotenuse =  a
	elsif (b>a)&&(b>c)
		cathet1 = a
		cathet2 = c
		hypotenuse = b
	else
		cathet1 = a
		cathet2 = b
		hypotenuse = c
		
	end
if (hypotenuse**2) == (cathet1**2) + (cathet2**2)
	p "треугольник прямоугольным"
elsif a.to_f==b.to_f && a.to_f==c.to_f && c.to_f==b.to_f
  puts "треугольник равностороний"
elsif a.to_f==b.to_f || b.to_f==c.to_f || c.to_f == a.to_f
  puts "треугольник равнобедренный"
else 
  puts "все стороны разные"
end

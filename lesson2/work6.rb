cart = Hash.new 
sum = 0
loop do
  print "Название товара (или стоп): "
  name = gets.chomp
break if name == "стоп"
print "Цена товара: "
price = gets.chomp.to_f
print "Количество товара: "
count = gets.chomp.to_f

cart[name] = {price: price, count: count, sum: price * count }
end

cart.each {|name, hash| sum += hash[:sum]}	

puts cart
puts "Итого #{sum}"



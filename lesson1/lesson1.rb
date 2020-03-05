puts "Введите имя"
name = gets.chomp

puts "введите свой рост"
height = gets.chomp

puts "Введите ваш вес"
weight1 = gets.chomp

weight2 = (height.to_i - 110)*1.15

if weight1.to_i > weight2.to_i
	puts "#{name}, ваш вес больше на #{weight1.to_i-weight2.to_i} (вот ваш идеальный вес#{weight2.to_i})"
elsif weight1.to_i < weight2.to_i
	puts "#{name}, вам до идеального веса не хватаиет #{weight2.to_i-weight1.to_i}  (вот ваш идеальный вес#{weight2.to_i})"
else
	puts "#{name}, у вас уже идеальный вес, поздравялю"
end

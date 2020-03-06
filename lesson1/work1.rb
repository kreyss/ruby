puts "Введите имя"
name = gets.chomp

puts "введите свой рост"
height = gets.chomp.to_i

puts "Введите ваш вес"
weight1 = gets.chomp.to_i

weight2.to_i = (height - 110) * 1.15

if weight1 > weight2
  puts "#{name}, ваш вес больше на #{weight1 - weight2} (вот ваш идеальный вес #{weight2})"
elsif weight1 < weight2
  puts "#{name}, вам до идеального веса не хватаиет #{weight2 - weight1} (вот ваш идеальный вес #{weight2})"
else
  puts "#{name}, у вас уже идеальный вес, поздравялю"
end

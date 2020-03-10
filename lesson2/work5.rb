print "Введите день "
day = gets.chomp.to_i
print "Введите месяц "
month = gets.chomp.to_i
print "Введите год "
year = gets.chomp.to_i

day_month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].sum
day_month[1] = 29 if year % 400 == 0 && (year % 4 == 0 && year % 100 == 0)

number = 0
number = day + day_month.take(month)

puts "Порядковый номер #{number}"

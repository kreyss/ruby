fibanachi = [0, 1]
i = 2

loop do 
	next_fibanachi = fibanachi[-1] + fibanachi[-2]
	break if next_fibanachi >= 100
	fibanachi << next_fibanachi
end
puts fibanachi

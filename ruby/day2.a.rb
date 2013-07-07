mArray = (1..16).to_a

i = 0

mArray.each do |num|
	p mArray[i, 4] if i % 4 == 0
	i += 1
end

mArray.each_slice(4) {|nums| p nums}

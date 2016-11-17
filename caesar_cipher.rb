def caesar_cipher (sentence, shift_amount)
	sentence.split("").collect do |letter|
		if letter.ord.between?(65,90)
			letter = shift(letter.ord, shift_amount, 65, 90).chr
		elsif letter.ord.between?(97,122)
			letter = shift(letter.ord, shift_amount, 97, 122).chr
		else
			letter
		end
	end.join
end

def shift(position, increment, down, up)
	if position + increment > up
		position = (position + increment) - (up - down) -1
	elsif position + increment < down
		position = (position + increment) + (up - down) + 1
	else
		position += increment
	end
end

input = "a Hello, this IS FROM shaunZ!"
puts caesar_cipher(input, -1)
			
def bubble_sort (inputs)
	loop do
		i, swap = 0, 0
		while i < inputs.length - 1
			if inputs[i+1] < inputs[i]
				inputs[i], inputs[i+1] = inputs[i+1], inputs[i]
				swap += 1
			end
			i += 1
		end
		break if swap == 0
	end
	inputs
end


def bubble_sort_by (inputs)
	loop do
		i, swap = 0, 0
		while i < inputs.length - 1
			if yield(inputs[i], inputs[i+1]) > 0
				inputs[i], inputs[i+1] = inputs[i+1], inputs[i]
				swap += 1
			end
			i += 1
		end
		break if swap == 0
	end
	inputs
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end

bubble_sort [4,3,78,2,0,2]

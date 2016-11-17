def merge_sort(array)
	return array if array.length == 1

	mid = array.length / 2
	left = array[0, mid]
	right = array[mid, array.length]

	left = merge_sort left
	right = merge_sort right
	merge left, right
end

def merge(left, right)
	merged = []
	until left.empty? || right.empty?
    if left.first < right.first
      merged << left.shift
    else
      merged << right.shift
    end
  end
  
  merged += left + right
end

# puts merge_sort [4,83,15,23,7,99,32,2,43]
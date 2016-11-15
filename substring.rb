def substrings(sentence, dictionary)
	words = sentence.downcase.split(/\W+/)
	result = {};

	words.each do |w|
    word = w.downcase
		if dictionary.include? word
			result.has_key?(word) ? result[word] +=1 : result[word] = 1
		end
	end

	result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner IT, sit down! How's it going?", dictionary)
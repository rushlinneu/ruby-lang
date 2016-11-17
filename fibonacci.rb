def fibs(n)
	cur, nxt = 1, 1
	result = []
	n.times do
		result << cur
		cur, nxt = nxt, cur+nxt
	end
	return result
end

def fibs_rec(n, lst=[1, 1])
	n < 3? lst : fibs_rec(n-1, lst+[lst[-1]+lst[-2]])
end
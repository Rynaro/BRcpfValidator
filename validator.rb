def validateCPF(doc)

	blacklist = ["00000000000", "11111111111", "22222222222", "33333333333", "44444444444", "55555555555", "66666666666", "77777777777", "88888888888", "99999999999" ]

	if !blacklist.rindex(doc)
		sldoc = doc.slice(0..8).chars.to_a
		sum = 0
		(sldoc.reverse).each_with_index do |a, i|
			sum += a.to_i*(i+2)
		end
	
		sum = sum%11
		sum = sum < 2 ? 0 : 11-sum
		sldoc.push(sum)
		sum = 0

		(sldoc.reverse).each_with_index do |a, i|
			sum += a.to_i*(i+2)		
		end

		sum = sum%11
		sum = sum < 2 ? 0 : 11-sum
		sldoc.push(sum)

		sldoc = sldoc.join

		sldoc = sldoc.eql?(doc) ? true : false

	else
		sldoc = false
	end

	sldoc

end

json.array! @ratings do |rating|
	json.id rating.id
	json.loi rating.loi
	json.q1 rating.q1
	json.q2 rating.q2
	json.q3 rating.q3
	json.q4 rating.q4
	json.q5 rating.q5
	json.weighted_score rating.weighted_score
end
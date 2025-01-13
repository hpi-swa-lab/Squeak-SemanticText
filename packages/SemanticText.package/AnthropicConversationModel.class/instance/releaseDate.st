accessing
releaseDate

	self flag: #modelConstants.
	
	^ self name
		caseOf: {
			"Latest versions - handle specially since date is not in name"
			[self class claude35SonnetLatestName] -> [Date year: 2024 month: 10 day: 22].
			[self class claude35HaikuLatestName] -> [Date year: 2024 month: 10 day: 22].
			[self class claude3OpusLatestName] -> [Date year: 2024 month: 2 day: 29]}
		otherwise:
			[(self name includesSubstring: 'claude') 
				ifTrue: [
					"Extract date from model name (format: yyyymmdd)"
					| dateStr |
					dateStr := (self name last: 8).
					Date 
						year: (dateStr first: 4) asNumber
						month: ((dateStr copyFrom: 5 to: 6) asNumber)
						day: ((dateStr copyFrom: 7 to: 8) asNumber)]]
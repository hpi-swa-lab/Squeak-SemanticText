accessing
releaseDate

	self flag: #modelConstants.
	
	^ self name
		caseOf:
			{"GPT-3.5 Turbo"
			[self class gpt35Turbo0125Name] -> [Date year: 2024 month: 1 day: 25].
			[self class gpt35Turbo1106Name] -> [Date year: 2023 month: 11 day: 6].
			[self class gpt35Turbo0613Name] -> [Date year: 2023 month: 6 day: 13].
			"[self class gpt35Turbo0301Name] -> [Date year: 2023 month: 3 day: 1]."
			[self class gpt35Turbo16k0613Name] -> [Date year: 2023 month: 6 day: 13].
			
			"GPT-4"
			[self class gpt4_0613Name] -> [Date year: 2023 month: 6 day: 13].
			[self class gpt4_32k0613Name] -> [Date year: 2023 month: 6 day: 13].
			
			"GPT-4 Turbo"
			[self class gpt4_20240409Name] -> [Date year: 2024 month: 4 day: 9].
			[self class gpt4_0125Name] -> [Date year: 2024 month: 1 day: 25].
			[self class gpt4_1106Name] -> [Date year: 2023 month: 11 day: 6]}
		otherwise: []
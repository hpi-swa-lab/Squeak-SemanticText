accessing
resolvedName

	self flag: #modelConstants.
	^ self name
		caseOf:
			{"GPT-3.5 Turbo"
			[self class gpt35TurboName] -> [self class gpt35Turbo0125Name].
			[self class gpt35Turbo16kName] -> [self class gpt35Turbo0125Name].
			
			"GPT-4"
			[self class gpt4Name] -> [self class gpt4_0613Name].
			[self class gpt4_32kName] -> [self class gpt4_32k0613Name].
			
			"GPT-4 Turbo"
			[self class gpt4TurboName] -> [self class gpt4_20240409Name].
			[self class gpt4TurboPreviewName] -> [self class gpt4_0125Name].
			
			"GPT-4o"
			[self class gpt4oName] -> [self class gpt4o_20240513Name].
			
			"GPT-4o mini"
			[self class gpt4oMiniName] -> [self class gpt4oMini_20240718Name]}
		otherwise: [:originalName | originalName]
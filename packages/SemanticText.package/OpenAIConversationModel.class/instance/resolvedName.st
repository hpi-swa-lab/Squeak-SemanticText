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
			[self class gpt4oName] -> [self class gpt4o_20240806Name].
			[self class gpt4oAudioPreviewName] -> [self class gpt4oAudioPreview_20241001Name].
			
			"GPT-4o mini"
			[self class gpt4oMiniName] -> [self class gpt4oMini_20240718Name].
			[self class gpt4oMiniAudioPreviewName] -> [self class gpt4oMiniAudioPreview_20241217Name].
			
			"GPT-4.1"
			[self class gpt41Name] -> [self class gpt41_20250414Name].
			[self class gpt41MiniName] -> [self class gpt41Mini_20250414Name].
			[self class gpt41NanoName] -> [self class gpt41Nano_20250414Name].
			
			"GPT-4.5"
			[self class gpt45PreviewName] -> [self class gpt45Preview_20250227Name].
			
			"o1"
			[self class o1Name] -> [self class o1_20241217Name].
			[self class o1PreviewName] -> [self class o1Preview_20240912Name].
			[self class o1MiniName] -> [self class o1Mini_20240912Name].
			
			"o3"
			[self class o3Name] -> [self class o3_20250416Name].
			[self class o3MiniName] -> [self class o3Mini_20250131Name].
			
			"o4"
			[self class o4MiniName] -> [self class o4Mini_20250416Name].
			
			"GPT-5"
			[self class gpt5Name] -> [self class gpt5_20250807Name].
			[self class gpt5MiniName] -> [self class gpt5Mini_20250807Name].
			[self class gpt5NanoName] -> [self class gpt5Nano_20250807Name]}
		otherwise: [:originalName | originalName]
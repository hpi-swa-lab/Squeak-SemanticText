accessing
centsPerCachedPromptToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	
	"GPT-4.1"
	(self resolvedName beginsWith: self class gpt41MiniName) ifTrue: [^ 0.00001s].
	(self resolvedName beginsWith: self class gpt41NanoName) ifTrue: [^ 0.0000025s].
	(self resolvedName beginsWith: self class gpt41Name) ifTrue: [^ 0.00005s].
	
	"GPT-5"
	(self resolvedName beginsWith: self class gpt5MiniName) ifTrue: [^ 0.0000025s].
	(self resolvedName beginsWith: self class gpt5NanoName) ifTrue: [^ 0.0000005s].
	(self resolvedName beginsWith: self class gpt5Name) ifTrue: [^ 0.0000125s].
	
	^ self resolvedName caseOf:
		{"GPT-4o"
		[self class gpt4o_20241120Name] -> [0.000125s].
		[self class gpt4o_20240806Name] -> [0.000125s].
		[self class gpt4o_20240513Name] -> [0.0005s flag: #todo "still up to date? or do all 4o models now cost the same?"].
		"for later: vision: unclear"
		
		"GPT-4o mini"
		[self class gpt4oMini_20240718Name] -> [0.0000075s].
		"for later: vision: unclear"
		
		"GPT-4.5"
		[self class gpt45Preview_20250227Name] -> [0.00375s].
		
		"GPT-5"
		[self class gpt5ChatLatestName] -> [0.0000125s].
		
		"o1"
		[self class o1_20241217Name] -> [0.00075s].
		[self class o1Preview_20240912Name] -> [0.00075s].
		
		"o1-mini"
		[self class o1Mini_20240912Name] -> [0.000055s].
		
		"o3"
		[self class o3_20250416Name] -> [0.00005s].
		
		"o3-mini"
		[self class o3Mini_20250131Name] -> [0.000055s].
		
		"o4-mini"
		[self class o4Mini_20250416Name] -> [0.0000275s]}
accessing
centsPerCompletionToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	
	^ self resolvedName caseOf:
		{"GPT-3.5 Turbo"
		[self class gpt35Turbo0125Name] -> [0.00015s].
		[self class gpt35Turbo1106Name] -> [0.0002s].
		[self class gpt35Turbo0613Name] -> [0.0002s].
		"[self class gpt35Turbo0301Name] -> [0.0002s]."
		[self class gpt35Turbo16k0613Name] -> [0.0004s].
		"[self class gpt35TurboInstructName] -> [0.0002s]."
		
		"GPT-4"
		[self class gpt4_0613Name] -> [0.006s].
		[self class gpt4_32k0613Name] -> [0.012s].
		
		"GPT-4 Turbo"
		[self class gpt4_20240409Name] -> [0.003s].
		[self class gpt4_0125Name] -> [0.003s].
		[self class gpt4_1106Name] -> [0.003s].
		
		"GPT-4o"
		[self class gpt4o_20240806Name] -> [0.001s].
		[self class gpt4o_20240513Name] -> [0.0015s].
		"for later: vision: unclear"
		
		"GPT-4o mini"
		[self class gpt4oMini_20240718Name] -> [0.00006s].
		"for later: vision: unclear"}
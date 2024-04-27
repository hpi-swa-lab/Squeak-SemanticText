accessing
centsPerPromptToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	
	^ self resolvedName caseOf:
		{"GPT-3.5 Turbo"
		[self class gpt35Turbo0125Name] -> [0.00005].
		[self class gpt35Turbo1106Name] -> [0.0001].
		[self class gpt35Turbo0613Name] -> [0.00015].
		"[self class gpt35Turbo0301Name] -> [0.00015]."
		[self class gpt35Turbo16k0613Name] -> [0.0003].
		"[self class gpt35TurboInstructName] -> [0.00015]."
		
		"GPT-4"
		[self class gpt4_0613Name] -> [0.003].
		[self class gpt4_32k0613Name] -> [0.006].
		
		"GPT-4 Turbo"
		[self class gpt4_20240409Name] -> [0.001].
		[self class gpt4_0125Name] -> [0.001].
		[self class gpt4_1106Name] -> [0.001].
		"for later: vision: unclear"}
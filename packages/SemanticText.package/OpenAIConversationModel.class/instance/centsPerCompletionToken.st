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
		[self class chatgpt4oLatestName] -> [0.0015s].
		[self class gpt4o_20241120Name] -> [0.001s].
		[self class gpt4o_20240806Name] -> [0.001s].
		[self class gpt4o_20240513Name] -> [0.0015s].
		
		"GPT-4o mini"
		[self class gpt4oMini_20240718Name] -> [0.00006s].
		"for later: vision: unclear"
		
		"GPT-4o Audio Preview"
		[self class gpt4oAudioPreview_20241217Name] -> [0.001s].
		[self class gpt4oAudioPreview_20241001Name] -> [0.001s].
		
		"GPT-4o Mini Audio Preview"
		[self class gpt4oMiniAudioPreview_20241217Name] -> [0.00006s].
		
		"GPT-4.5"
		[self class gpt45Preview_20250227Name] -> [0.015s].
		
		"o1"
		[self class o1_20241217Name] -> [0.006s].
		[self class o1Preview_20240912Name] -> [0.006s].
		
		"o1-mini"
		[self class o1Mini_20240912Name] -> [0.00044s].
		
		"o3-mini"
		[self class o3Mini_20250131Name] -> [0.00044s]}

"do any of the above constants have changed, based on the contents from the pricing website presented below? if yes, answer the updated source code of the above method. do not change the formatting. do not add new models that were not in included in the source code before.

the pricing website:"
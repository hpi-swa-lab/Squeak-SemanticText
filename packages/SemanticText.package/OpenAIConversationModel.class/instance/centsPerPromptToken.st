accessing
centsPerPromptToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	
	"GPT Audio"
	(self resolvedName beginsWith: self class gptAudioMiniName) ifTrue: [^ 0.00025s].
	(self resolvedName beginsWith: self class gptAudioName) ifTrue: [^ 0.00006s].
	
	"GPT-4.1"
	(self resolvedName beginsWith: self class gpt41MiniName) ifTrue: [^ 0.00004s].
	(self resolvedName beginsWith: self class gpt41NanoName) ifTrue: [^ 0.00001s].
	(self resolvedName beginsWith: self class gpt41Name) ifTrue: [^ 0.0002s].
	
	"GPT-5"
	(self resolvedName beginsWith: self class gpt5MiniName) ifTrue: [^ 0.000025s].
	(self resolvedName beginsWith: self class gpt5NanoName) ifTrue: [^ 0.000005s].
	(self resolvedName beginsWith: self class gpt5Name) ifTrue: [^ 0.000125s].
	
	^ self resolvedName caseOf:
		{"GPT-3.5 Turbo"
		[self class gpt35Turbo0125Name] -> [0.00005s].
		[self class gpt35Turbo1106Name] -> [0.0001s].
		[self class gpt35Turbo0613Name] -> [0.00015s].
		"[self class gpt35Turbo0301Name] -> [0.00015s]."
		[self class gpt35Turbo16k0613Name] -> [0.0003s].
		"[self class gpt35TurboInstructName] -> [0.00015s]."
		
		"GPT-4"
		[self class gpt4_0613Name] -> [0.003s].
		[self class gpt4_32k0613Name] -> [0.006s].
		
		"GPT-4 Turbo"
		[self class gpt4_20240409Name] -> [0.001s].
		[self class gpt4_0125Name] -> [0.001s].
		[self class gpt4_1106Name] -> [0.001s].
		"for later: vision: unclear"
		
		"GPT-4o"
		[self class chatgpt4oLatestName] -> [0.0005s].
		[self class gpt4o_20241120Name] -> [0.00025s].
		[self class gpt4o_20240806Name] -> [0.00025s].
		[self class gpt4o_20240513Name] -> [0.0005s].
		"for later: vision: unclear"
		
		"GPT-4o mini"
		[self class gpt4oMini_20240718Name] -> [0.000015s].
		"for later: vision: unclear"
		
		"GPT-4o Audio Preview"
		[self class gpt4oAudioPreview_20241217Name] -> [0.00025s].
		[self class gpt4oAudioPreview_20241001Name] -> [0.00025s].
		
		"GPT-4o Mini Audio Preview"
		[self class gpt4oMiniAudioPreview_20241217Name] -> [0.000015s].
		
		"GPT-4.5"
		[self class gpt45Preview_20250227Name] -> [0.0075s].
		
		"GPT-5"
		[self class gpt5ChatLatestName] -> [0.000125s].
		
		"o1"
		[self class o1_20241217Name] -> [0.0015s].
		[self class o1Preview_20240912Name] -> [0.0015s].
		
		"o1-mini"
		[self class o1Mini_20240912Name] -> [0.0003s].
		
		"o3"
		[self class o3_20250416Name] -> [0.0002s].
		
		"o3-mini"
		[self class o3Mini_20250131Name] -> [0.00011s].
		
		"o4-mini"
		[self class o4Mini_20250416Name] -> [0.00011s]}

"do any of the above constants have changed, based on the contents from the pricing website presented below? if yes, answer the updated source code of the above method. do not change the formatting. do not add new models that were not in included in the source code before.

the pricing website:"
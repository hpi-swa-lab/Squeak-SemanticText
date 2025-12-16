parsing
assertConversationItem: aMessageOrFunctionCall equals: json

	| ourJson theirJson |
	json type = 'function_call' ifTrue:
		[^ self assertFunctionCall: aMessageOrFunctionCall equals: json].
	json type = 'function_call_output' ifTrue:
		[^ self assert: aMessageOrFunctionCall asOpenAIRealtimeObject output = json output].
	
	ourJson := aMessageOrFunctionCall asOpenAIRealtimeObject content asJsonString parseAsJson.
	"remove data the server does not output"
	ourJson do: [:part |
		part
			removeKey: 'image_url' ifAbsent: [];
			removeKey: 'audio' ifAbsent: []].
	(ourJson size = 2 and: [ourJson first type = 'input_audio'] and: [ourJson second type = 'input_text']) ifTrue:
		[ourJson first transcript: (ourJson second text ifEmpty: [nil]).
		ourJson := ourJson first: 1].
	theirJson := json content asJsonString parseAsJson. "copy + unordered comparison"
	self assert: ourJson = theirJson.
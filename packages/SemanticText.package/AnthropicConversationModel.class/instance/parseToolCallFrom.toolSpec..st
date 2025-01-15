private - requests
parseToolCallFrom: toolCall toolSpec: aToolSpecOrNil

	| name input function |
	name := toolCall name.
	input := toolCall input.
	
	function := aToolSpecOrNil ifNotNil:
		[aToolSpecOrNil toolNamed: name ifAbsent: []].
	
	"Below was `input parseAsOrderedJson`, but I don't know how to convert from JsonObject to OrderedJsonObject. I just left it as JsonObject for now."
	self flag: #todo.
	^ SemanticToolCall
		key: toolCall id
		tool: (function ifNil: [name])
		"It seems like OpenAI gives us the input as a plain string, whereas Anthropic gives us a JSON object"
		arguments: input
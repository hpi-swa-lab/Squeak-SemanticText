private
parseToolCallFrom: toolCall toolSpec: aToolSpecOrNil

	| arguments function functionName |
	self assert: toolCall type = #function.
	functionName := toolCall function name.
	arguments := toolCall function arguments.
	
	function := aToolSpecOrNil ifNotNil:
		[aToolSpecOrNil toolNamed: functionName ifAbsent: []].
	
	^ SemanticToolCall
		key: toolCall id
		tool: (function ifNil: [functionName])
		arguments: ([arguments parseAsOrderedJson] ifError: [arguments])
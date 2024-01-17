private
addToolSpec: aToolSpec toInput: input

	input tools:
		(aToolSpec tools asArray collect: [:tool | tool asOpenAIObject]).
	
	aToolSpec forcedTools ifNotNil: [:forcedTools |
		input tool_choice:
			(forcedTools
				ifEmpty: [#none]
				ifNotEmpty:
					[| forcedTool |
					forcedTools size > 1 ifTrue: [^ self error: 'cannot force multiple tools'].
					forcedTool := forcedTools anyOne.
					(forcedTool isString or: [forcedTool isText])
						ifTrue: [forcedTool asString]
						ifFalse: [forcedTool asOpenAIToolChoiceObject]])]
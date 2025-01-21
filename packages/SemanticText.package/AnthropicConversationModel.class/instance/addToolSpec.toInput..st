private - requests
addToolSpec: aToolSpec toInput: input

	input tools:
		(aToolSpec tools asArray collect: [:tool | tool asAnthropicObject]).
	
	aToolSpec forcedTools ifNotNil: [:forcedTools |
		input tool_choice:
			(forcedTools = #any
				ifTrue: [#required]
				ifFalse:
					[forcedTools
						ifEmpty: [#none]
						ifNotEmpty:
							[| forcedTool |
							forcedTools size > 1 ifTrue: [^ self error: 'cannot force multiple tools'].
							forcedTool := forcedTools anyOne.
							(forcedTool isString or: [forcedTool isText])
								ifTrue: [forcedTool := aToolSpec toolNamed: forcedTool].
							forcedTool asAnthropicToolChoiceObject]])]
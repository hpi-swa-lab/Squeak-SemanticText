client events - private
addToolSpec: aToolSpec toInput: input

	| forcedTools |
	input tools:
		(aToolSpec tools asArray collect: [:tool | tool asOpenAIRealtimeObject]).
	
	forcedTools := aToolSpec forcedTools.
	input tool_choice:
		(forcedTools
			caseOf:
				{[nil] -> [#auto].
				[#any] -> [#required].
				[#()] -> [#none]}
			otherwise:
				[| tool |
				forcedTools size > 1 ifTrue: [^ self error: 'cannot force multiple tools'].
				tool := forcedTools anyOne.
				(tool isString or: [tool isText])
					ifFalse: [tool := tool name].
				JsonObject new
					type: #function;
					name: tool]).
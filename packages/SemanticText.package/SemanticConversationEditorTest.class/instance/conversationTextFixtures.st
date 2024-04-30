tests
conversationTextFixtures

	| conversation |
	self flag: #todo. "also test intentional changes to text (three-way parsing)? e.g., intentional deleting of assistant messages in minimal mode does not work!"
	
	"each: {conversation. advancedModeText. defaultModeText[. minimalModeText]}"
	^ {{SemanticConversation new.
	Text new.
	Text new}.
	
	
	{conversation := SemanticConversation new
		addSystemMessage: 'system 1';
		addUserMessage: 'user 1';
		addAssistantMessage: 'assistant 1';
		yourself.
'`<b>System:</b> system 1`[1]

`<b>User:</b> user 1`[2]

`<b>Assistant:</b> assistant 1`[3]' semanticAsTextFromHtmlKeepNewlines
		semanticFormatAttributes:
			{SemanticConversationEditorMessageAttribute message: conversation messages first.
			SemanticConversationEditorMessageAttribute message: conversation messages second.
			SemanticConversationEditorMessageAttribute message: conversation messages third}.
'`<b>User:</b> user 1`[1]

`<b>Assistant:</b> assistant 1`[2]' semanticAsTextFromHtmlKeepNewlines
		semanticFormatAttributes:
			{SemanticConversationEditorMessageAttribute message: conversation messages second.
			SemanticConversationEditorMessageAttribute message: conversation messages third}}}
	
	
	, (Array streamContents: [:stream |
		| combinations |
		combinations := #((false true) (false true) (1 2))
			inject: #(()) into: [:paths :alternatives |
				paths gather: [:path |
					alternatives collect: [:alternative |
						path copyWith: alternative]]].
		combinations do: [:permutation |
			| localToolSpec forceTool toolCalls labelToolCallMessage functions toolSpec copy |
			localToolSpec := permutation first.
			forceTool := permutation second.
			toolCalls := permutation third.
			labelToolCallMessage := toolCalls > 1.
			
			functions :=
				{SemanticFunction fromSignatureString: 'plonk "comment"(arg: string)' action: #doPlonk.
				SemanticFunction fromSignatureString: 'griffle' action: #doGriffle}.
				
			conversation := SemanticConversation new.
			localToolSpec ifFalse:
				[conversation addFunctions: functions.
				forceTool ifTrue: [conversation defaultToolSpec forcedTools: (functions first: 1)].
				
				stream nextPut:
					{copy := conversation copy.
					'`<i>Available tools (force: {1}): plonk "comment" (arg: string)
griffle()</i>`[1]' semanticAsTextFromHtmlKeepNewlines
						semanticFormat: {forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil']}
						attributes:
							{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
							TextInspectIt on: copy defaultToolSpec}}.
					'`<i>Available tools: plonk, griffle</i>`[1]' semanticAsTextFromHtmlKeepNewlines semanticFormatAttributes:
						{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
						TextInspectIt on: copy defaultToolSpec}}.
					Text new}].
			
			conversation addSystemMessage: 'system 1'.
			
			conversation addUserMessage: 'user 1'.
			localToolSpec ifTrue:
				[conversation
					pushFunctions: functions force: (forceTool ifTrue: [functions first: 1]);
					popToolSpec.
				
				stream nextPut:
					{copy := conversation copy.
					'`<b>System:</b> system 1`[1]

`<b>User:</b> user 1`[2]

`<i>Available tools (force: {1}): plonk "comment" (arg: string)
griffle()</i>`[3]' semanticAsTextFromHtmlKeepNewlines
						semanticFormat: {forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil']}
						attributes:
							{SemanticConversationEditorMessageAttribute message: copy messages first.
							SemanticConversationEditorMessageAttribute message: copy messages second.
							{SemanticConversationEditorToolSpecAttribute toolSpec: (copy toolSpecFor: copy lastMessage).
							TextInspectIt on: (copy toolSpecFor: copy lastMessage)}}.
					'`<b>User:</b> user 1`[1]

`<i>Available tools: plonk, griffle</i>`[2]' semanticAsTextFromHtmlKeepNewlines
						semanticFormatAttributes:
							{SemanticConversationEditorMessageAttribute message: copy messages second.
							{SemanticConversationEditorToolSpecAttribute toolSpec: (copy toolSpecFor: copy lastMessage).
							TextInspectIt on: (copy toolSpecFor: copy lastMessage)}}.
					'`<b>User:</b> user 1`[1]' semanticAsTextFromHtmlKeepNewlines
						semanticFormatAttributes:
							{SemanticConversationEditorMessageAttribute message: copy messages second}}].
			
			toolSpec := conversation defaultToolSpec ifNil: [conversation toolSpecFor: conversation lastMessage].
			forceTool ifFalse:
				[conversation addAssistantMessage: 'assistant 1'.
				
				localToolSpec ifFalse:
					[stream nextPut:
						{copy := conversation copy.
						'`<i>Available tools (force: {1}): plonk "comment" (arg: string)
griffle()</i>`[1]

`<b>System:</b> system 1`[2]

`<b>User:</b> user 1`[3]

`<b>Assistant:</b> assistant 1`[4]' semanticAsTextFromHtmlKeepNewlines
								semanticFormat: {forceTool ifTrue: ['#plonk'] ifFalse: ['nil']}
								attributes:
									{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
									TextInspectIt on: copy defaultToolSpec}.
									SemanticConversationEditorMessageAttribute message: copy messages first.
									SemanticConversationEditorMessageAttribute message: copy messages second.
									SemanticConversationEditorMessageAttribute message: copy messages third}.
						'`<i>Available tools: plonk, griffle</i>`[1]

`<b>User:</b> user 1`[2]

`<b>Assistant:</b> assistant 1`[3]' semanticAsTextFromHtmlKeepNewlines
								semanticFormatAttributes:
									{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
									TextInspectIt on: copy defaultToolSpec}.
									SemanticConversationEditorMessageAttribute message: copy messages second.
									SemanticConversationEditorMessageAttribute message: copy messages third}.
						'`<b>User:</b> user 1`[1]

`<b>Assistant:</b> assistant 1`[2]' semanticAsTextFromHtmlKeepNewlines
								semanticFormatAttributes:
									{SemanticConversationEditorMessageAttribute message: copy messages second.
									SemanticConversationEditorMessageAttribute message: copy messages third}}]].
			
			conversation addAssistantMessage: (labelToolCallMessage ifTrue: ['assistant 2']).
			conversation lastMessage toolCalls:
				{(toolSpec toolNamed: #plonk) asToolCallWithKey: 'call_1' arguments: #('one')}.
			toolCalls > 1 ifTrue:
				[conversation lastMessage toolCalls:
					conversation lastMessage toolCalls ,
						{(toolSpec toolNamed: #griffle) asToolCallWithKey: 'call_2' arguments: #()}].
			
			localToolSpec ifFalse:
				[stream nextPut:
					{copy := conversation copy.
					('`<i>Available tools (force: {1}): plonk "comment" (arg: string)
griffle()</i>`[1]

`<b>System:</b> system 1`[2]

`<b>User:</b> user 1`[3]

' , (forceTool ifFalse: ['`<b>Assistant:</b> assistant 1`[4]

'] ifTrue: ['']) ,
'`<b>Assistant:</b> {2}`<i>\[call_1] plonk(arg="one")</i>`[6]' , (toolCalls > 1 ifTrue: ['
`<i>\[call_2] griffle()</i>`[7]'] ifFalse: ['']) , '`[5]') semanticAsTextFromHtmlKeepNewlines
						semanticFormat:
							{forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil'].
							labelToolCallMessage ifTrue: ['assistant 2

'] ifFalse: ['

' flag: #todo "should be ''"]}
						attributes:
							{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
							TextInspectIt on: copy defaultToolSpec}.
							SemanticConversationEditorMessageAttribute message: copy messages first.
							SemanticConversationEditorMessageAttribute message: copy messages second.
							SemanticConversationEditorMessageAttribute message: copy messages third.
							SemanticConversationEditorMessageAttribute message: copy lastMessage.
							TextInspectIt on: copy lastMessage toolCalls first.
							TextInspectIt on: (copy lastMessage toolCalls at: 2 ifAbsent: [nil])}.
					('`<i>Available tools: plonk, griffle</i>`[1]

`<b>User:</b> user 1`[2]

`<b>Assistant:</b> ' , (forceTool
	ifFalse:
		[labelToolCallMessage
			ifFalse:
				['assistant 1`[3]

`']
			ifTrue:
				['assistant 1`[3]

`assistant 2

']]
	ifTrue:
		[labelToolCallMessage
			ifFalse:
				['

']
			ifTrue:
				['assistant 2

']]) , '`<i>\[plonk...]</i>`[5]' , (toolCalls > 1 ifTrue: [' `<i>\[griffle...]</i>`[6]'] ifFalse: ['']) , '`[4]') semanticAsTextFromHtmlKeepNewlines
							semanticFormatAttributes:
								{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
								TextInspectIt on: copy defaultToolSpec}.
								SemanticConversationEditorMessageAttribute message: copy messages second.
								SemanticConversationEditorMessageAttribute message: copy messages third.
								SemanticConversationEditorMessageAttribute message: copy lastMessage.
								TextInspectIt on: copy lastMessage toolCalls first -> nil.
								TextInspectIt on: (copy lastMessage toolCalls at: 2 ifAbsent: [nil]) -> nil}.
					('`<b>User:</b> user 1`[1]

`<b>Assistant:</b> ' , (forceTool
	ifFalse:
		[labelToolCallMessage
			ifFalse:
				['assistant 1`[2]

`']
			ifTrue:
				['assistant 1`[2]

`assistant 2

']]
	ifTrue:
		[labelToolCallMessage
			ifFalse:
				['

']
			ifTrue:
				['assistant 2

']]) , '`[3]') semanticAsTextFromHtmlKeepNewlines
							semanticFormatAttributes:
								{SemanticConversationEditorMessageAttribute message: copy messages second.
								SemanticConversationEditorMessageAttribute message: copy messages third.
								SemanticConversationEditorMessageAttribute message: copy lastMessage}}].
			
			conversation addMessage:
				(conversation lastMessage toolCalls first asToolMessageWithResult: 'eins').
			
			(localToolSpec not and: [forceTool]) ifTrue:
				[stream nextPut:
					{copy := conversation copy.
					('`<i>Available tools (force: {1}): plonk "comment" (arg: string)
griffle()</i>`[1]

`<b>System:</b> system 1`[2]

`<b>User:</b> user 1`[3]

`<b>Assistant:</b> {2}`<i>\[call_1] plonk(arg="one")</i>`[5]' , (toolCalls > 1 ifTrue: ['
`<i>\[call_2] griffle()</i>`[6]'] ifFalse: ['']) , '`[4]

`<b>Tool:</b> `<i>\[call_1]</i> eins`[8]`[7]') semanticAsTextFromHtmlKeepNewlines
						semanticFormat:
							{forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil'].
							labelToolCallMessage ifTrue: ['assistant 2

'] ifFalse: ['

' flag: #todo "should be ''"]}
						attributes:
							{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
							TextInspectIt on: copy defaultToolSpec}.
							SemanticConversationEditorMessageAttribute message: copy messages first.
							SemanticConversationEditorMessageAttribute message: copy messages second.
							SemanticConversationEditorMessageAttribute message: copy messages third.
							TextInspectIt on: copy messages third toolCalls first.
							TextInspectIt on: (copy messages third toolCalls at: 2 ifAbsent: [nil]).
							SemanticConversationEditorMessageAttribute message: copy messages fourth.
							TextInspectIt on: copy messages fourth content}.
					('`<i>Available tools: plonk, griffle</i>`[1]

`<b>User:</b> user 1`[2]

`<b>Assistant:</b> ' , (labelToolCallMessage
	ifFalse:
		['

']
	ifTrue:
		['assistant 2

']) , '`<i>\[plonk]</i>`[4]' , (toolCalls > 1 ifTrue: [' `<i>\[griffle...]</i>`[5]'] ifFalse: ['']) , '`[3]') semanticAsTextFromHtmlKeepNewlines
							semanticFormatAttributes:
								{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
								TextInspectIt on: copy defaultToolSpec}.
								SemanticConversationEditorMessageAttribute message: copy messages second.
								SemanticConversationEditorMessageAttribute message: copy messages third.
								TextInspectIt on: copy messages third toolCalls first -> 'eins'.
								TextInspectIt on: (copy messages third toolCalls at: 2 ifAbsent: [nil]) -> nil}.
					('`<b>User:</b> user 1`[1]

`<b>Assistant:</b> ' , (labelToolCallMessage
	ifFalse:
		['

']
	ifTrue:
		['assistant 2

']) , '`[2]') semanticAsTextFromHtmlKeepNewlines
							semanticFormatAttributes:
								{SemanticConversationEditorMessageAttribute message: copy messages second.
								SemanticConversationEditorMessageAttribute message: copy messages third}}].
			
			toolCalls > 1 ifTrue:
				[conversation addMessage:
					((conversation messages atLast: 2) toolCalls second asToolMessageWithResult: 'ok').
				(localToolSpec not and: [forceTool]) ifTrue:
					[stream nextPut:
						{copy := conversation copy.
						('`<i>Available tools (force: {1}): plonk "comment" (arg: string)
griffle()</i>`[1]

`<b>System:</b> system 1`[2]

`<b>User:</b> user 1`[3]

`<b>Assistant:</b> assistant 2

`<i>\[call_1] plonk(arg="one")</i>`[5]
`<i>\[call_2] griffle()</i>`[6]`[4]

`<b>Tool:</b> `<i>\[call_1]</i> eins`[8]`[7]

`<b>Tool:</b> `<i>\[call_2]</i> ok`[10]`[9]') semanticAsTextFromHtmlKeepNewlines
							semanticFormat:
								{forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil']}
							attributes:
								{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
								TextInspectIt on: copy defaultToolSpec}.
								SemanticConversationEditorMessageAttribute message: copy messages first.
								SemanticConversationEditorMessageAttribute message: copy messages second.
								SemanticConversationEditorMessageAttribute message: copy messages third.
								TextInspectIt on: copy messages third toolCalls first.
								TextInspectIt on: (copy messages third toolCalls at: 2 ifAbsent: [nil]).
								SemanticConversationEditorMessageAttribute message: copy messages fourth.
								TextInspectIt on: copy messages fourth content.
								SemanticConversationEditorMessageAttribute message: copy messages fifth.
								TextInspectIt on: copy messages fifth content}.
						('`<i>Available tools: plonk, griffle</i>`[1]

`<b>User:</b> user 1`[2]

`<b>Assistant:</b> assistant 2

`<i>\[plonk]</i>`[4] `<i>\[griffle]</i>`[5]`[3]') semanticAsTextFromHtmlKeepNewlines
								semanticFormatAttributes:
									{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
									TextInspectIt on: copy defaultToolSpec}.
									SemanticConversationEditorMessageAttribute message: copy messages second.
									SemanticConversationEditorMessageAttribute message: copy messages third.
									TextInspectIt on: copy messages third toolCalls first -> 'eins'.
									TextInspectIt on: copy messages third toolCalls second -> 'ok'}.
						('`<b>User:</b> user 1`[1]

`<b>Assistant:</b> assistant 2`[2]') semanticAsTextFromHtmlKeepNewlines
								semanticFormatAttributes:
									{SemanticConversationEditorMessageAttribute message: copy messages second.
									SemanticConversationEditorMessageAttribute message: copy messages third}}]].
			
			conversation addAssistantMessage: 'assistant 3'.
			
			(localToolSpec not and: [forceTool] and: [toolCalls > 1]) ifTrue:
				[stream nextPut:
					{copy := conversation copy.
					('`<i>Available tools (force: {1}): plonk "comment" (arg: string)
griffle()</i>`[1]

`<b>System:</b> system 1`[2]

`<b>User:</b> user 1`[3]

`<b>Assistant:</b> assistant 2

`<i>\[call_1] plonk(arg="one")</i>`[5]
`<i>\[call_2] griffle()</i>`[6]`[4]

`<b>Tool:</b> `<i>\[call_1]</i> eins`[8]`[7]

`<b>Tool:</b> `<i>\[call_2]</i> ok`[10]`[9]

`<b>Assistant:</b> assistant 3`[11]') semanticAsTextFromHtmlKeepNewlines
						semanticFormat:
							{forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil']}
						attributes:
							{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
							TextInspectIt on: copy defaultToolSpec}.
							SemanticConversationEditorMessageAttribute message: copy messages first.
							SemanticConversationEditorMessageAttribute message: copy messages second.
							SemanticConversationEditorMessageAttribute message: copy messages third.
							TextInspectIt on: copy messages third toolCalls first.
							TextInspectIt on: (copy messages third toolCalls at: 2 ifAbsent: [nil]).
							SemanticConversationEditorMessageAttribute message: copy messages fourth.
							TextInspectIt on: copy messages fourth content.
							SemanticConversationEditorMessageAttribute message: copy messages fifth.
							TextInspectIt on: copy messages fifth content.
							SemanticConversationEditorMessageAttribute message: copy messages sixth}.
					('`<i>Available tools: plonk, griffle</i>`[1]

`<b>User:</b> user 1`[2]

`<b>Assistant:</b> assistant 2

`<i>\[plonk]</i>`[4] `<i>\[griffle]</i>`[5]`[3]

`assistant 3`[6]') semanticAsTextFromHtmlKeepNewlines
							semanticFormatAttributes:
								{{SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
								TextInspectIt on: copy defaultToolSpec}.
								SemanticConversationEditorMessageAttribute message: copy messages second.
								SemanticConversationEditorMessageAttribute message: copy messages third.
								TextInspectIt on: copy messages third toolCalls first -> 'eins'.
								TextInspectIt on: copy messages third toolCalls second -> 'ok'.
								SemanticConversationEditorMessageAttribute message: copy messages sixth}}].
			
			conversation addAssistantMessage: 'assistant 4']]).
"'`<i>Available tools (force: nil): plonk ""comment"" (arg: string)
griffle()</i>`[1]

`<b>System:</b> system 1`[2]

`<b>User:</b> user 1`[3]

`<b>Assistant:</b> assistant 1`[4]

`<i>`\[call_1] plonk(arg=""one"")`[6]</i>`[5]

`<b>Tool:</b> `<i>\[call_1]</i> eins`[8]`[7]

`<b>Assistant:</b> assistant 2`[9]' semanticAsTextFromHtmlKeepNewlines
					formatAttributes:
						{{SemanticConversationEditorToolSpecAttribute toolSpec: conversation defaultToolSpec.
						TextInspectIt on: conversation defaultToolSpec}.
						SemanticConversationEditorMessageAttribute message: conversation messages first.
						SemanticConversationEditorMessageAttribute message: conversation messages second.
						SemanticConversationEditorMessageAttribute message: conversation messages third.
						SemanticConversationEditorMessageAttribute message: conversation messages third.
						TextInspectIt on: conversation messages third toolCalls first.
						SemanticConversationEditorMessageAttribute message: conversation messages fourth.
						TextInspectIt on: conversation messages fourth object.
						SemanticConversationEditorMessageAttribute message: conversation messages fifth}.
'`<i>Available tools: plonk, griffle</i>`[1] 

`<b>User:</b> user 1`[2]

<b>Assistant:</b> `assistant 1`[3]

<i>`\[plonk]`[4]</i> 

`assistant 2`[5]' semanticAsTextFromHtmlKeepNewlines
					flag: #todo: ""eliminate spaces after tool specs/tools"";
					formatAttributes:
						{{SemanticConversationEditorToolSpecAttribute toolSpec: conversation defaultToolSpec.
						TextInspectIt on: conversation defaultToolSpec}.
						SemanticConversationEditorMessageAttribute message: conversation messages second.
						SemanticConversationEditorMessageAttribute message: conversation messages third.
						TextInspectIt on: conversation messages third toolCalls first -> conversation messages fourth object.
						SemanticConversationEditorMessageAttribute message: conversation messages fifth}"
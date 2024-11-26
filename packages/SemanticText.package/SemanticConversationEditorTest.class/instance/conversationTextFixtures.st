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
				{SemanticFunction fromSignatureString: 'plonk "comment
second line"(arg: string)' action: #doPlonk.
				SemanticFunction fromSignatureString: 'griffle' action: #doGriffle}.
				
			conversation := SemanticConversation new.
			localToolSpec ifFalse:
				[conversation addFunctions: functions.
				forceTool ifTrue: [conversation defaultToolSpec forcedTools: (functions first: 1)].
				
				stream nextPut:
					{copy := conversation copy.
					'`<i>`Available tools (force: {1}):`[1] `plonk "comment
second line" (arg: string)`[2]
`griffle()`[3]</i>`[4]' semanticAsTextFromHtmlKeepNewlines
						semanticFormat: {forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil']}
						attributes:
							{TextInspectIt on: copy defaultToolSpec.
							TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
							TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
							SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec}.
					'`<i>`Available tools:`[1] `plonk`[2], `griffle`[3]</i>`[4]' semanticAsTextFromHtmlKeepNewlines semanticFormatAttributes:
						{TextInspectIt on: copy defaultToolSpec.
						TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
						TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
						SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec}.
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

`<i>`Available tools (force: {1}):`[3] `plonk "comment
second line" (arg: string)`[4]
`griffle()`[5]</i>`[6]' semanticAsTextFromHtmlKeepNewlines
						semanticFormat: {forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil']}
						attributes:
							{SemanticConversationEditorMessageAttribute message: copy messages first.
							SemanticConversationEditorMessageAttribute message: copy messages second.
							TextInspectIt on: (copy toolSpecFor: copy lastMessage).
							TextInspectIt on: ((copy toolSpecFor: copy lastMessage) toolNamed: #plonk).
							TextInspectIt on: ((copy toolSpecFor: copy lastMessage) toolNamed: #griffle).
							SemanticConversationEditorToolSpecAttribute toolSpec: (copy toolSpecFor: copy lastMessage)}.
					'`<b>User:</b> user 1`[1]

`<i>`Available tools:`[2] `plonk`[3], `griffle`[4]</i>`[5]' semanticAsTextFromHtmlKeepNewlines
						semanticFormatAttributes:
							{SemanticConversationEditorMessageAttribute message: copy messages second.
							TextInspectIt on: (copy toolSpecFor: copy lastMessage).
							TextInspectIt on: ((copy toolSpecFor: copy lastMessage) toolNamed: #plonk).
							TextInspectIt on: ((copy toolSpecFor: copy lastMessage) toolNamed: #griffle).
							SemanticConversationEditorToolSpecAttribute toolSpec: (copy toolSpecFor: copy lastMessage)}.
					'`<b>User:</b> user 1`[1]' semanticAsTextFromHtmlKeepNewlines
						semanticFormatAttributes:
							{SemanticConversationEditorMessageAttribute message: copy messages second}}].
			
			toolSpec := conversation defaultToolSpec ifNil: [conversation toolSpecFor: conversation lastMessage].
			forceTool ifFalse:
				[conversation addAssistantMessage: 'assistant 1'.
				
				localToolSpec ifFalse:
					[stream nextPut:
						{copy := conversation copy.
						'`<i>`Available tools (force: {1}):`[1] `plonk "comment
second line" (arg: string)`[2]
`griffle()`[3]</i>`[4]

`<b>System:</b> system 1`[5]

`<b>User:</b> user 1`[6]

`<b>Assistant:</b> assistant 1`[7]' semanticAsTextFromHtmlKeepNewlines
								semanticFormat: {forceTool ifTrue: ['#plonk'] ifFalse: ['nil']}
								attributes:
									{TextInspectIt on: copy defaultToolSpec.
									TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
									TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
									SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
									SemanticConversationEditorMessageAttribute message: copy messages first.
									SemanticConversationEditorMessageAttribute message: copy messages second.
									SemanticConversationEditorMessageAttribute message: copy messages third}.
						'`<i>`Available tools:`[1] `plonk`[2], `griffle`[3]</i>`[4]

`<b>User:</b> user 1`[5]

`<b>Assistant:</b> assistant 1`[6]' semanticAsTextFromHtmlKeepNewlines
								semanticFormatAttributes:
									{TextInspectIt on: copy defaultToolSpec.
									TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
									TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
									SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
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
					('`<i>`Available tools (force: {1}):`[1] `plonk "comment
second line" (arg: string)`[2]
`griffle()`[3]</i>`[4]

`<b>System:</b> system 1`[5]

`<b>User:</b> user 1`[6]

' , (forceTool ifFalse: ['`<b>Assistant:</b> assistant 1`[7]

'] ifTrue: ['']) ,
'`<b>Assistant:</b> {2}`<i>\[call_1] plonk(arg="one")</i>`[9]' , (toolCalls > 1 ifTrue: ['
`<i>\[call_2] griffle()</i>`[10]'] ifFalse: ['']) , '`[8]') semanticAsTextFromHtmlKeepNewlines
						semanticFormat:
							{forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil'].
							labelToolCallMessage ifTrue: ['assistant 2

'] ifFalse: ['

' flag: #todo "should be ''"]}
						attributes:
							{TextInspectIt on: copy defaultToolSpec.
							TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
							TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
							SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
							SemanticConversationEditorMessageAttribute message: copy messages first.
							SemanticConversationEditorMessageAttribute message: copy messages second.
							SemanticConversationEditorMessageAttribute message: copy messages third.
							SemanticConversationEditorMessageAttribute message: copy lastMessage.
							TextInspectIt on: copy lastMessage toolCalls first.
							TextInspectIt on: (copy lastMessage toolCalls at: 2 ifAbsent: [nil])}.
					('`<i>`Available tools:`[1] `plonk`[2], `griffle`[3]</i>`[4]

`<b>User:</b> user 1`[5]

`<b>Assistant:</b> ' , (forceTool
	ifFalse:
		[labelToolCallMessage
			ifFalse:
				['assistant 1`[6]

`']
			ifTrue:
				['assistant 1`[6]

`assistant 2

']]
	ifTrue:
		[labelToolCallMessage
			ifFalse:
				['

']
			ifTrue:
				['assistant 2

']]) , '`<i>\[plonk...]</i>`[8]' , (toolCalls > 1 ifTrue: [' `<i>\[griffle...]</i>`[9]'] ifFalse: ['']) , '`[7]') semanticAsTextFromHtmlKeepNewlines
							semanticFormatAttributes:
								{TextInspectIt on: copy defaultToolSpec.
								TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
								TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
								SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
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
					('`<i>`Available tools (force: {1}):`[1] `plonk "comment
second line" (arg: string)`[2]
`griffle()`[3]</i>`[4]

`<b>System:</b> system 1`[5]

`<b>User:</b> user 1`[6]

`<b>Assistant:</b> {2}`<i>\[call_1] plonk(arg="one")</i>`[8]' , (toolCalls > 1 ifTrue: ['
`<i>\[call_2] griffle()</i>`[9]'] ifFalse: ['']) , '`[7]

`<b>Tool:</b> `<i>\[call_1]</i> eins`[11]`[10]') semanticAsTextFromHtmlKeepNewlines
						semanticFormat:
							{forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil'].
							labelToolCallMessage ifTrue: ['assistant 2

'] ifFalse: ['

' flag: #todo "should be ''"]}
						attributes:
							{TextInspectIt on: copy defaultToolSpec.
							TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
							TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
							SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
							SemanticConversationEditorMessageAttribute message: copy messages first.
							SemanticConversationEditorMessageAttribute message: copy messages second.
							SemanticConversationEditorMessageAttribute message: copy messages third.
							TextInspectIt on: copy messages third toolCalls first.
							TextInspectIt on: (copy messages third toolCalls at: 2 ifAbsent: [nil]).
							SemanticConversationEditorMessageAttribute message: copy messages fourth.
							TextInspectIt on: copy messages fourth content}.
					('`<i>`Available tools:`[1] `plonk`[2], `griffle`[3]</i>`[4]

`<b>User:</b> user 1`[5]

`<b>Assistant:</b> ' , (labelToolCallMessage
	ifFalse:
		['

']
	ifTrue:
		['assistant 2

']) , '`<i>\[plonk]</i>`[7]' , (toolCalls > 1 ifTrue: [' `<i>\[griffle...]</i>`[8]'] ifFalse: ['']) , '`[6]') semanticAsTextFromHtmlKeepNewlines
							semanticFormatAttributes:
								{TextInspectIt on: copy defaultToolSpec.
								TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
								TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
								SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
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
						('`<i>`Available tools (force: {1}):`[1] `plonk "comment
second line" (arg: string)`[2]
`griffle()`[3]</i>`[4]

`<b>System:</b> system 1`[5]

`<b>User:</b> user 1`[6]

`<b>Assistant:</b> assistant 2

`<i>\[call_1] plonk(arg="one")</i>`[8]
`<i>\[call_2] griffle()</i>`[9]`[7]

`<b>Tool:</b> `<i>\[call_1]</i> eins`[11]`[10]

`<b>Tool:</b> `<i>\[call_2]</i> ok`[13]`[12]') semanticAsTextFromHtmlKeepNewlines
							semanticFormat:
								{forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil']}
							attributes:
								{TextInspectIt on: copy defaultToolSpec.
								TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
								TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
								SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
								SemanticConversationEditorMessageAttribute message: copy messages first.
								SemanticConversationEditorMessageAttribute message: copy messages second.
								SemanticConversationEditorMessageAttribute message: copy messages third.
								TextInspectIt on: copy messages third toolCalls first.
								TextInspectIt on: (copy messages third toolCalls at: 2 ifAbsent: [nil]).
								SemanticConversationEditorMessageAttribute message: copy messages fourth.
								TextInspectIt on: copy messages fourth content.
								SemanticConversationEditorMessageAttribute message: copy messages fifth.
								TextInspectIt on: copy messages fifth content}.
						('`<i>`Available tools:`[1] `plonk`[2], `griffle`[3]</i>`[4]

`<b>User:</b> user 1`[5]

`<b>Assistant:</b> assistant 2

`<i>\[plonk]</i>`[7] `<i>\[griffle]</i>`[8]`[6]') semanticAsTextFromHtmlKeepNewlines
								semanticFormatAttributes:
									{TextInspectIt on: copy defaultToolSpec.
									TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
									TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
									SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
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
					('`<i>`Available tools (force: {1}):`[1] `plonk "comment
second line" (arg: string)`[2]
`griffle()`[3]</i>`[4]

`<b>System:</b> system 1`[5]

`<b>User:</b> user 1`[6]

`<b>Assistant:</b> assistant 2

`<i>\[call_1] plonk(arg="one")</i>`[8]
`<i>\[call_2] griffle()</i>`[9]`[7]

`<b>Tool:</b> `<i>\[call_1]</i> eins`[11]`[10]

`<b>Tool:</b> `<i>\[call_2]</i> ok`[13]`[12]

`<b>Assistant:</b> assistant 3`[14]') semanticAsTextFromHtmlKeepNewlines
						semanticFormat:
							{forceTool ifTrue: ['#(''plonk'')'] ifFalse: ['nil']}
						attributes:
							{TextInspectIt on: copy defaultToolSpec.
							TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
							TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
							SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
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
					('`<i>`Available tools:`[1] `plonk`[2], `griffle`[3]</i>`[4]

`<b>User:</b> user 1`[5]

`<b>Assistant:</b> assistant 2

`<i>\[plonk]</i>`[7] `<i>\[griffle]</i>`[8]`[6]

`assistant 3`[9]') semanticAsTextFromHtmlKeepNewlines
							semanticFormatAttributes:
								{TextInspectIt on: copy defaultToolSpec.
								TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
								TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
								SemanticConversationEditorToolSpecAttribute toolSpec: copy defaultToolSpec.
								SemanticConversationEditorMessageAttribute message: copy messages second.
								SemanticConversationEditorMessageAttribute message: copy messages third.
								TextInspectIt on: copy messages third toolCalls first -> 'eins'.
								TextInspectIt on: copy messages third toolCalls second -> 'ok'.
								SemanticConversationEditorMessageAttribute message: copy messages sixth}}].
			
			conversation addAssistantMessage: 'assistant 4']]).
"'`<i>`Available tools (force: nil):`[1] `plonk ""comment
second line"" (arg: string)`[2]
`griffle()`[3]</i>`[4]

`<b>System:</b> system 1`[5]

`<b>User:</b> user 1`[6]

`<b>Assistant:</b> assistant 1`[7]

`<i>`\[call_1] plonk(arg=""one"")`[9]</i>`[8]

`<b>Tool:</b> `<i>\[call_1]</i> eins`[11]`[10]

`<b>Assistant:</b> assistant 2`[12]' semanticAsTextFromHtmlKeepNewlines
					formatAttributes:
						{TextInspectIt on: copy defaultToolSpec.
						TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
						TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
						SemanticConversationEditorToolSpecAttribute toolSpec: conversation defaultToolSpec.
						SemanticConversationEditorMessageAttribute message: conversation messages first.
						SemanticConversationEditorMessageAttribute message: conversation messages second.
						SemanticConversationEditorMessageAttribute message: conversation messages third.
						SemanticConversationEditorMessageAttribute message: conversation messages third.
						TextInspectIt on: conversation messages third toolCalls first.
						SemanticConversationEditorMessageAttribute message: conversation messages fourth.
						TextInspectIt on: conversation messages fourth object.
						SemanticConversationEditorMessageAttribute message: conversation messages fifth}.
'`<i>`Available tools:`[1] `plonk`[2], `griffle`[3]</i>`[4] 

`<b>User:</b> user 1`[5]

<b>Assistant:</b> `assistant 1`[6]

<i>`\[plonk]`[7]</i> 

`assistant 2`[8]' semanticAsTextFromHtmlKeepNewlines
					flag: #todo: ""eliminate spaces after tool specs/tools"";
					formatAttributes:
						{TextInspectIt on: copy defaultToolSpec.
						TextInspectIt on: (copy defaultToolSpec toolNamed: #plonk).
						TextInspectIt on: (copy defaultToolSpec toolNamed: #griffle).
						SemanticConversationEditorToolSpecAttribute toolSpec: conversation defaultToolSpec.
						SemanticConversationEditorMessageAttribute message: conversation messages second.
						SemanticConversationEditorMessageAttribute message: conversation messages third.
						TextInspectIt on: conversation messages third toolCalls first -> conversation messages fourth object.
						SemanticConversationEditorMessageAttribute message: conversation messages fifth}"
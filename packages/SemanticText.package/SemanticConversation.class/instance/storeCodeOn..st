as yet unclassified
storeCodeOn: aStream

	aStream
		nextPutAll: self species name;
		space;
		nextPutAll:
			((self shouldStream ifNil: [false]) ifTrue: [#newStreaming] ifFalse: [#new]);
		crtab.
	
	self defaultToolSpec ifNotNil: [:toolSpec |
		toolSpec tools valuesDo: [:tool |
			tool type caseOf:
				{[#function] ->
					[aStream
						nextPutAll: #addFunction:;
						space;
						print: tool signatureString;
						space.
					tool storeActionCodeOn: aStream]}.
			aStream nextPut: $;; crtab].
		toolSpec forcedTools ifNotNil: [:forcedTools |
			aStream
				nextPutAll: #in:;
				space;
				nextPutAll: '[:conversation | conversation';
				space;
				nextPutAll: #defaultToolSpec;
				space;
				nextPutAll: #forcedTools:;
				space.
			toolSpec storeForcedToolsCodeOn: aStream.
			aStream
				nextPutAll: '];'; crtab]].
	
	self messages withIndexDo: [:message :messageIndex |
		message isToolMessage
			ifFalse:
				[aStream
					nextPutAll:
						(message role caseOf: {[#system] -> [#addSystemMessage:]. [#user] -> [#addUserMessage:]. [#assistant] -> [#addAssistantMessage:]});
					space;
					print: message content;
					nextPut: $;;
					crtab]
			ifTrue:
				[(self messages
					at: messageIndex - 1
					ifPresent: [:previousMessage |
						(previousMessage toolCalls includes: message toolCall)
							and:
								[| toolMessages |
								toolMessages := Array streamContents: [:toolMessagesStream |
									self messages readStream in: [:messagesStream |
										messagesStream skip: messageIndex - 1.
										[messagesStream peek isToolMessage]
											whileTrue: [toolMessagesStream nextPut: messagesStream next]]].
								previousMessage toolCalls allSatisfy: [:toolCall |
									toolMessages anySatisfy: [:toolMessage |
										toolMessage isToolMessage and: [toolMessage toolCall = toolCall]]]]]
					ifAbsent: [false])
						ifTrue:
							[aStream nextPutAll: #resolveAllToolCalls; nextPut: $;; crtab]
						ifFalse:
							[aStream
								nextPutAll: #addMessage:;
								nextPut: $(;
								space.
							message storeCodeOn: aStream.
							aStream
								nextPut: $); crtab]].
		
		message toolCalls ifNotEmpty: [:toolCalls |
			aStream
				nextPutAll: #in:;
				space;
				nextPutAll: '[:conversation |';
				crtab: 2.
			aStream nextPutAll:
				'conversation lastMessage toolCalls:
			{'.
			toolCalls
				do: [:toolCall |
					aStream
						nextPutAll: '(conversation activeToolSpec toolNamed: ';
						print: toolCall toolName;
						nextPut: $);
						space;
						nextPutAll: #asToolCallWithArguments:;
						space;
						store: toolCall arguments values]
				separatedBy:
					[aStream crtab: 3].
			aStream nextPutAll: '}];'; crtab].
		
		self toolSpecFor: message ifPresent: [:toolSpec |
			(toolSpec tools allSatisfy: [:tool | tool type = #function])
				ifTrue:
					[aStream
						nextPutAll: #pushFunctions:;
						crtab: 2;
						nextPut: ${.
					toolSpec tools
						do: [:tool | tool storeCodeOn: aStream]
						separatedBy: [aStream nextPut: $.; crtab: 2].
					aStream nextPut: $}.
					toolSpec forcedTools ifNotNil: [:forcedTools |
						aStream
							space;
							nextPutAll: #force:;
							space.
						toolSpec storeForcedToolsCodeOn: aStream].
					aStream nextPut: $;; crtab]
				ifFalse:
					[(toolSpec tools collect: #type) caseError]]].
	
	aStream nextPutAll: #yourself.
service
getAnswers: number for: aConversation config: aConfigOrNil
	"Generate <number> assistant replies in response to aConversation. Answer a collection of new SemanticMessages for each new reply. If #shouldStream is set to true, the answers will be SemanticStreamingMessages that are completed in the background."

	| config protoReply replies replyMessages |
	config := self baseConfig.
	aConfigOrNil ifNotNil:
		[config := config updatedWith: aConfigOrNil].
	
	protoReply := self generateReplyFor: aConversation config: config.
	replies := number > 1
		ifFalse:
			[{(protoReply respondsTo: #cull:cull:)
				ifTrue: [protoReply cull: aConversation cull: 1]
				ifFalse: [protoReply]}]
		ifTrue:
			[(1 to: number) collect: [:index |
				(protoReply respondsTo: #cull:cull:)
					ifTrue: [protoReply cull: aConversation cull: index]
					ifFalse: ['[{1}] {2}' format: {index. protoReply}]]].
	
	replyMessages := replies collect: [:reply |
		(reply isKindOf: SemanticMessage)
			ifTrue: [reply]
			ifFalse: [SemanticMessage conversation: aConversation role: #assistant contentParts: reply]].
	^ config shouldStream
		ifFalse:
			[replyMessages]
		ifTrue:
			[SemanticStreamingMessage
				conversation: number
				array: number
				role: #assistant
				inBackgroundDo: [:messages |
					| partStreams interChunkDuration |
					interChunkDuration := (config mockConfig tokensPerSecond ifNil: [self defaultTokensPerSecond])
						reciprocal seconds.
					partStreams := replyMessages collect: [:replyMessage |
						replyMessage contentParts readStream collect: [:part |
							(part isString or: [part isText]) ifTrue: [part readStream] ifFalse: [part]]].
					[| allAtEnd |
					allAtEnd := true.
					partStreams with: messages do: [:partStream :message |
						| chunk |
						partStream atEnd ifFalse:
							[| part |
							[part := partStream peek]
								doWhileTrue:
									[part notNil and:
										[(part isStream and: [part atEnd])
											ifTrue: [partStream next];
											yourself]].
							part ifNotNil:
								[interChunkDuration wait.
								part isStream
									ifFalse:
										[chunk := part semanticContentPartText , String cr.
										partStream next]
									ifTrue:
										[chunk := part upToAnyOf: Character separators.
										part atEnd ifFalse:
											[chunk := chunk , part peekBack asString]].
								message addChunk: chunk.
								part semanticIsSound ifTrue:
									[message addedSoundChunk: part at: 1].
								allAtEnd := false]]].
					allAtEnd] whileFalse]]
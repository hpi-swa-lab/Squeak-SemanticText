service
getAnswers: number for: aConversation config: aConfigOrNil
	"Generate <number> assistant replies in response to aConversation. Answer a collection of new SemanticMessages for each new reply. If #shouldStream is set to true, the answers will be SemanticStreamingMessages that are completed in the background."

	| config protoReply replies |
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
	
	^ config shouldStream
		ifFalse:
			[replies collect: [:reply |
				(reply isKindOf: SemanticMessage)
					ifTrue: [reply]
					ifFalse: [SemanticMessage conversation: aConversation role: #assistant content: reply]]]
		ifTrue:
			[SemanticStreamingMessage
				conversation: number
				array: number
				role: #assistant
				inBackgroundDo: [:messages |
					| streams interChunkDuration |
					interChunkDuration := (config mockConfig tokensPerSecond ifNil: [self defaultTokensPerSecond])
						reciprocal seconds.
					streams := replies collect: [:reply |
						(reply isKindOf: SemanticMessage)
							ifTrue: [self halt: 'streaming of mockConfig reply messages not yet supported']
							ifFalse: [reply readStream]].
					[| allAtEnd |
					allAtEnd := true.
					streams with: messages do: [:stream :message |
						| chunk |
						stream atEnd ifFalse:
							[interChunkDuration wait.
							chunk := stream upToAnyOf: Character separators.
							stream atEnd ifFalse:
								[chunk := chunk , stream peekBack].
							message addChunk: chunk.
							allAtEnd := false]].
					allAtEnd] whileFalse]]
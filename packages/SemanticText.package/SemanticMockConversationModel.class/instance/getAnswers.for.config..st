service
getAnswers: number for: aConversation config: aConfigOrNil
	"Generate <number> assistant replies in response to aConversation. Answer a collection of new SemanticMessages for each new reply. If #shouldStream is set to true, the answers will be SemanticStreamingMessages that are completed in the background."

	| config protoReply replies |
	config := self baseConfig.
	aConfigOrNil ifNotNil:
		[config := config updatedWith: aConfigOrNil].
	
	protoReply := self generateReplyFor: aConversation.
	replies := number > 1
		ifFalse: [{protoReply}]
		ifTrue:
			[(1 to: number) collect: [:index |
				'[{1}] {2}' format: {index. protoReply}]].
	
	^ config shouldStream
		ifFalse:
			[replies collect: [:reply |
				SemanticMessage conversation: aConversation role: #assistant content: reply]]
		ifTrue:
			[SemanticStreamingMessage
				conversation: number
				array: number
				role: #assistant
				inBackgroundDo: [:messages |
					| streams |
					streams := replies collect: [:reply | reply readStream].
					[| allAtEnd |
					allAtEnd := true.
					streams with: messages do: [:stream :message |
						| chunk |
						stream atEnd ifFalse:
							[0.05 seconds wait.
							chunk := stream upToAnyOf: Character separators.
							stream atEnd ifFalse:
								[chunk := chunk , stream peekBack].
							message addChunk: chunk.
							allAtEnd := false]].
					allAtEnd] whileFalse]]
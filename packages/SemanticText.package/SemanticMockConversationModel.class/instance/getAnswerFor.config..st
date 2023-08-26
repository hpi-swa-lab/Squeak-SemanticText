service
getAnswerFor: aConversation config: aConfigOrNil
	"Generate an assistant reply in response to aConversation. Answer a new SemanticMessage for the new reply. If #shouldStream is set to true, the answer may be SemanticStreamingMessage (depending on the model's capabilities) that is completed in the background."

	| config reply |
	config := self baseConfig.
	aConfigOrNil ifNotNil:
		[config := config updatedWith: aConfigOrNil].
	
	reply := self generateReplyFor: aConversation.
	
	^ config shouldStream
		ifFalse:
			[SemanticMessage role: #assistant content: reply]
		ifTrue:
			[SemanticStreamingMessage role: #assistant inBackgroundDo: [:message |
				reply readStream in: [:stream |
					| chunk |
					[stream atEnd] whileFalse:
						[0.05 seconds wait.
						chunk := stream upToAnyOf: Character separators.
						stream atEnd ifFalse:
							[chunk := chunk , stream peekBack].
						message addChunk: chunk]]]]
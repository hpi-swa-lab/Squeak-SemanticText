private
addSystemInstructionsMessageFromServer

	self instructions ifNotNil: [^ self].
	
	self currentSessionProperties instructions ifNotNil: [:instructions |
		| instructionsMessage |
		instructionsMessage := SemanticMessage
			role: #system
			content: instructions.
		instructionsMessage isRealtimeInstructions: true.
		self conversation messages: (self conversation messages copyWithFirst: instructionsMessage)].
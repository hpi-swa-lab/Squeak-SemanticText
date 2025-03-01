*SemanticText-Model-Conversation-converting
semanticContentPartText

	^ Text streamContents: [:stream |
		self semanticContentPartTextOn: stream]
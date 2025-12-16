*SemanticText-Providers-OpenAI-testing-pseudo-override
isSecure

	self flag: #moveUpstream.
	^ scheme = 'https' or: [scheme = 'wss']
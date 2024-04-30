*SemanticText-Tools-Conversation-tests
testSemanticFormatAttributeErrors

	self semanticFixturesFormatAttributeErrors do: [ :each |
		self should: [ each asText semanticFormat: { 'x' } attributes: {TextEmphasis bold} ] raise: Error ]
*SemanticText-Tools-Conversation-tests
testSemanticFormatAttributes

	self semanticFixturesFormatAttributes do: [ :fixture | | expectedResult actualResult |
		expectedResult := fixture fourth.
		actualResult := fixture first semanticFormat: fixture second attributes: fixture third.
		self
			assert: expectedResult equals: actualResult;
			assert: expectedResult runs size equals: actualResult runs size.
		1 to: expectedResult size do: [ :i |
			self
				assert: (expectedResult attributesAt: i) asSet
				equals: (actualResult attributesAt: i) asSet ] ]
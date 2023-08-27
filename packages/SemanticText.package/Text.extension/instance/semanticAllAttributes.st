*SemanticText-Tools-Conversation-emphasis
semanticAllAttributes

	self flag: #moveUpstream.
	^ OrderedCollection streamContents: [:stream |
		self runs do: [:attributes |
			attributes do: [:attribute |
				stream nextPut: attribute]]]
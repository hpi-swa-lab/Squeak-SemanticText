*SemanticText-Tools-Conversation-emphasis
semanticAllAttributesFrom: start to: stop

	self flag: #moveUpstream.
	^ OrderedCollection streamContents: [:stream |
		self runs from: start to: stop do: [:attributes |
			attributes do: [:attribute |
				stream nextPut: attribute]]]
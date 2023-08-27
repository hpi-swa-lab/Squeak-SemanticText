ui support
sendUpdatesFromTextModel: aModel selector: textSelector

	Smalltalk isMorphic ifFalse:
		[self when: #newChunk evaluate: [:chunk |
			Project current addDeferredUIMessage:
				[aModel changed: textSelector]].
		self when: #completed evaluate:
			[Project current addDeferredUIMessage:
				[aModel changed: textSelector]]].
	
	self when: #newChunk evaluate: [:chunk |
		Project current addDeferredUIMessage:
			[aModel changed: #insertTextReplacement with:
				{textSelector. chunk , self cursorText. self cursorText. true}]].
	self when: #completed evaluate:
		[Project current addDeferredUIMessage:
			[aModel changed: #insertTextReplacement with:
				{textSelector. ''. self cursorText. true}]].
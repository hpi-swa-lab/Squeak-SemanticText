private - text
conversationFromText: aText intervalsDo: intervalsBlockOrNil

	^ self
		conversationFromText: aText
		hasUserEdited: false
		intervalsDo: intervalsBlockOrNil
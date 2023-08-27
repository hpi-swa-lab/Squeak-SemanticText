*SemanticText-Model-Conversation-ui support-updating-override
update: aSymbol with: arg1

	aSymbol == #editString
		ifTrue: [
			self editString: arg1.
			self hasUnacceptedEdits: true.
			^ self].

	(aSymbol == #inputRequested and: [self getTextSelector == arg1 or: [self setTextSelector == arg1]])
		ifTrue: [
			self activeHand newKeyboardFocus: self.
			^ self].

	aSymbol == #textStyle
		ifTrue: [
			self setTextStyle: arg1.
			^ self].

	aSymbol == #font
		ifTrue: [
			self setFont: arg1.
			^ self].

	(aSymbol == #insertTextReplacement and: [self getTextSelector == arg1 first])
		"Models can use this to insert or append text to the morph without discarding unaccepted changes, the editing history, and, optionally, the selection and scroll position (if invisibly is true).
		Usage:
			model changed: #insertTextReplacement with: {#contents. 'replacement'. 'original'. invisibly}."
		ifTrue: [
			self insertText: arg1 second toReplace: (arg1 at: 3 ifAbsent: [nil]) invisibly: (arg1 at: 4 ifAbsent: [false])].
	
	^super update: aSymbol with: arg1
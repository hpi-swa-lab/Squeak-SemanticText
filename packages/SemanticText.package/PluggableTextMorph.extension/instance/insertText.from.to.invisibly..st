*SemanticText-Model-Conversation-ui support-model access-pseudo-override
insertText: newText from: start to: stop invisibly: invisibly

	invisibly
		ifTrue: [
			textMorph editor insertText: newText from: start to: stop invisibly: invisibly.
			textMorph selectionChanged.
			textMorph updateFromParagraph.
			self rememberSelectionInterval]
		ifFalse: [self handleEdit: [
			textMorph editor insertText: newText from: start to: stop invisibly: invisibly]].
	
	self flag: #todo. "Also preserve scroll position (which is NOT identical to the selection), so that insertions at the beginning do not interrupt the user further down in the text. This is rarely visible to the user, but should ultimately be done."
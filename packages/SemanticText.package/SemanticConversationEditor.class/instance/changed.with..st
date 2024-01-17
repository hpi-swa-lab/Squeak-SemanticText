updating
changed: aspect with: anObject

	(aspect = #insertTextReplacement and: [anObject first = #text] and: [anObject second isEmpty]) ifTrue:
		[(self conversation messages atLast: 1 ifPresent: [:lastMessage |
			lastMessage streamingToolCalls]) isEmptyOrNil ifFalse:
				["Tool calls may have been updated, fully refresh the text"
				self flag: #workaround. "Not so nice, as this jumps the selection again! Unfortunately, we cannot update multiple identical cursor texts."
				self changed: #text.
				^ self]].
	
	^ super changed: aspect with: anObject
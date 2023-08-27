private
fixUpEditStringEmphasis

	self flag: #workaround. "After sending #editString:, the cursor will still have bold emphasis until the user leaves and enters again the editor."
	Smalltalk isMorphic ifFalse: [^ self].
	(self anyTextPaneWithSelector: #text) textMorph editor clearEmphasisHere.
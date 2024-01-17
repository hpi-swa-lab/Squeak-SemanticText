actions
toggleAdvancedMode

	self mode:
		(self isAdvancedMode
			ifFalse: [#advanced]
			ifTrue: [#default]).
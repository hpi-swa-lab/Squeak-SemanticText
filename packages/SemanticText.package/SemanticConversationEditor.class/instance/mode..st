accessing
mode: aSymbol

	| wasAdvancedMode |
	self assert: (self allModes includes: aSymbol).
	
	wasAdvancedMode := self isAdvancedMode.
	mode := aSymbol.
	
	self changed: #mode.
	
	self isAdvancedMode = wasAdvancedMode ifFalse:
		[self updateAdvancedMode].
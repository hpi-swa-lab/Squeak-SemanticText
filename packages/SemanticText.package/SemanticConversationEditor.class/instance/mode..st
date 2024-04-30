accessing
mode: aSymbol

	| wasAdvancedMode |
	self assert: (self allModes includes: aSymbol).
	
	self mode = aSymbol ifTrue: [^ self].
	
	wasAdvancedMode := self isAdvancedMode.
	wasAdvancedMode = (aSymbol = #advanced) ifTrue:
		[mode := aSymbol.
		self changed: #mode.
		^ self].
	
	self updateAdvancedModeAround:
		[mode := aSymbol.
		self changed: #mode].
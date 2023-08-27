styling
unstyledTextFrom: aText

	| unstyledText |
	unstyledText := aText copy.
	self privateUnstyle: unstyledText.
	^ unstyledText
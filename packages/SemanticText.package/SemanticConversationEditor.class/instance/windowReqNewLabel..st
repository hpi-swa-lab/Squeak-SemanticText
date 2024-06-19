updating
windowReqNewLabel: newLabel

	| baseLabel |
	baseLabel := (newLabel first: (newLabel indexOfAnyOf: ':(' ifAbsent: newLabel size + 1) - 1) withBlanksTrimmed.
	originalLabel = baseLabel ifFalse:
		[originalLabel := baseLabel.
		self future changed: #labelString].
	^ true
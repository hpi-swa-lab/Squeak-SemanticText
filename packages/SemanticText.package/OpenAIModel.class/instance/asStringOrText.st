printing
asStringOrText

	| result |
	result := super asStringOrText.
	self isLegacy ifFalse: [^ result].
	
	^ result asText
		addAttributesForDeprecation;
		yourself
support
syncContentUpdatesFrom: anObject stringBlock: stringBlock to: editors

	| newString string updateBlock |
	anObject xxxSemanticUnTraceAll.
	string := stringBlock value: anObject.
	updateBlock := newString := nil.
	updateBlock := [editors first
		ifNil: [anObject xxxSemanticUnTrace: updateBlock]
		ifNotNil: [:editor |
			Project current addDeferredUIMessage:
				[editor changed: #insertTextReplacement with:
					{#text. newString. string. true}.
				string := newString]]].
	anObject
		evaluate: updateBlock
		wheneverChangeIn: [newString := stringBlock value: anObject].
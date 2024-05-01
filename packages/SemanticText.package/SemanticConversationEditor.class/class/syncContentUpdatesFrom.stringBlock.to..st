support
syncContentUpdatesFrom: anObject stringBlock: stringBlock to: editors

	| newString string updateBlock |
	self flag: #fixme. "Currently broken. The intent of this method would be to automatically update the textual representation of anObject in editors when it is changed externally (mostly, by editing it in an inspector). Unfortunately, there are still some unexplicable cascades of ObjectViewers that cause image freezes - is there maybe even something wrong with the become primitives?"
	true ifTrue: [^ self].
	
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
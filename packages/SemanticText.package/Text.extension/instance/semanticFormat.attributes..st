*SemanticText-Tools-Conversation-formatting
semanticFormat: arguments attributes: attributes

	| text attributeRanges |
	self flag: #moveUpstream.
	
	text := self class new: self size * 11 // 10 "+10%" streamContents: [ :output |
		| nextIndex key rangeStack |
		nextIndex := 1.
		key := 0.
		[ nextIndex <= self size ] whileTrue: [
			(self at: nextIndex) caseOf: {
				[ $\ ] -> [
					nextIndex := nextIndex + 1.
					output withAttributes: (runs at: nextIndex) do: [
						output nextPut: (self at: nextIndex) ] ].
				[ ${ ] -> [
					"Parse the index or key for argument substitution."
					| digitValue collectionIndex localAttributes |
					collectionIndex := 0.
					localAttributes := Set new.
					[ (digitValue := string basicAt: (nextIndex := nextIndex + 1)) between: 48 "$0 asciiValue" and: 57 "$9 asciiValue" ] whileTrue: [
						collectionIndex := collectionIndex * 10 + digitValue - 48 "$0 asciiValue".
						localAttributes addAll: (runs at: nextIndex) ].
					digitValue = 125 "$} asciiValue" ifFalse: [ self error: ('{1} expected' translated format: {$}}) ].
					output withAttributes: localAttributes do: [
						output nextPutAll: (arguments at: collectionIndex) asStringOrText ] ].
				[ $` ] -> [
					(nextIndex < self size and: [ (self at: nextIndex + 1) == $[ ])
						ifFalse: [
							"Start of formatted range."
							(rangeStack ifNil: [rangeStack := Stack new])
								push: output position + 1 ]
						ifTrue: [
							"End of formatted range."
							| rangeStart digitValue collectionIndex localAttributes |
							nextIndex := nextIndex + 1.
							rangeStart := rangeStack pop.
							collectionIndex := 0.
							localAttributes := Set new.
							[ (digitValue := string basicAt: (nextIndex := nextIndex + 1)) between: 48 "$0 asciiValue" and: 57 "$9 asciiValue" ] whileTrue: [
								collectionIndex := collectionIndex * 10 + digitValue - 48 "$0 asciiValue".
								localAttributes addAll: (runs at: nextIndex) ].
							digitValue = 93 "$] asciiValue" ifFalse: [ self error: ('{1} expected' translated format: {$]}) ].
							(attributeRanges ifNil: [attributeRanges := OrderedCollection new])
								addFirst: {attributes at: collectionIndex. rangeStart. output position} ] ]
				}
				otherwise: [
					output withAttributes: (runs at: nextIndex) do: [
						output nextPut: (self at: nextIndex) ] ].
			nextIndex := nextIndex + 1 ].
		rangeStack ifNotNil:
			[rangeStack isEmpty ifFalse:
				[ self error: '$` expected' translated ] ] ].
	
	attributeRanges ifNotNil: [
		attributeRanges do: [ :attributeRange |
			| attribute start stop |
			attribute := attributeRange first.
			start := attributeRange second.
			stop := attributeRange third.
			stop >= start ifTrue: [
				attribute isCollection
					ifFalse: [ text addAttribute: attribute from: start to: stop ]
					ifTrue: [ text addAllAttributes: attribute from: start to: stop ] ] ] ].
	
	^ text
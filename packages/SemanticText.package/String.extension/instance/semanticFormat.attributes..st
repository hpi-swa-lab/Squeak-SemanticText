*SemanticText-Tools-Conversation-formatting
semanticFormat: arguments attributes: attributes

	| string attributeRanges text |
	self flag: #todo. "also implement on Text"
	string := String
		new: self size * 11 // 10 "ready for +10% growth"
		streamContents:
			[ : output | | lastIndex nextIndex next key rangeStack |
			lastIndex := 1.
			key := 0.
			[ "stream to output until first {, `, or \"
			(nextIndex := self indexOfAnyOf: FormatAttributesCharacterSet startingAt: lastIndex) = 0 ] whileFalse:
				[ nextIndex = lastIndex ifFalse:
					[ output next: nextIndex - lastIndex putAll: self startingAt: lastIndex ].
				"special char hit, escape char?"
				(next := self at: nextIndex) == $\
					ifTrue: 
						[ "transfer the escaped character. "
						output nextPut: (self at: (nextIndex := nextIndex + 1)) ]
					ifFalse: [ next == ${ ifTrue:
						[ | nextKeyChar |
						"parse argument key"
						[ nextKeyChar := self at: (nextIndex := nextIndex + 1).
						FormatTokenCharacters includes: nextKeyChar ] whileTrue:
							[ (key isInteger and: [ nextKeyChar between: $0 and: $9 ])
								ifTrue: [ key := key * 10 + nextKeyChar digitValue ]
								ifFalse:
									[ key isInteger ifTrue:
										[ key := WriteStream with:
											(key isZero
												ifTrue: [ String empty ]
												ifFalse: [ key asString ]) ].
									key nextPut: nextKeyChar ] ].
						nextKeyChar == $} ifFalse: [ self error: '$} expected' translated ].
						key isInteger
							ifTrue:
								[ output nextPutAll: (arguments at: key) value asString.
								key := 0 ]
							ifFalse:
								[ output nextPutAll: (arguments at: key contents) value asString.
								key reset ] ]
					ifFalse:
						[ "$`".
						(nextIndex < self size and: [ (self at: nextIndex + 1) == $[ ])
							ifFalse:
								[ "start formatted range"
								(rangeStack ifNil: [rangeStack := Stack new])
									push: output position + 1 ]
							ifTrue:
								[ | rangeStart nextKeyChar attribute |
								 "end formatted range"
								nextIndex := nextIndex + 1.
								rangeStart := rangeStack pop.
								"parse attribute key"
								[ nextKeyChar := self at: (nextIndex := nextIndex + 1).
								FormatAttributesTokenCharacters includes: nextKeyChar ] whileTrue:
									[ (key isInteger and: [ nextKeyChar between: $0 and: $9 ])
										ifTrue: [ key := key * 10 + nextKeyChar digitValue ]
										ifFalse:
											[ key isInteger ifTrue:
												[ key := WriteStream with:
													(key isZero
														ifTrue: [ String empty ]
														ifFalse: [ key asString ]) ].
											key nextPut: nextKeyChar ] ].
								nextKeyChar == $] ifFalse: [ self error: '$] expected' translated ].
								key isInteger
									ifTrue:
										[ attribute := (attributes at: key) value.
										key := 0 ]
									ifFalse:
										[ attribute := (attributes at: key contents) value.
										key reset ].
								(attributeRanges ifNil: [attributeRanges := OrderedCollection new: attributes size])
									addFirst: {attribute. rangeStart. output position} ] ] ].
				lastIndex := nextIndex + 1 ].
			lastIndex <= self size ifTrue:
				[ output next: self size - lastIndex + 1 putAll: self startingAt: lastIndex ].
			rangeStack ifNotNil:
				[rangeStack  isEmpty ifFalse:
					[ self error: '$` expected' translated ] ] ].
	text := string asText.
	
	attributeRanges ifNotNil:
		[ attributeRanges do:
			[ :attributeRange | | attribute start stop |
			attribute := attributeRange first.
			start := attributeRange second.
			stop := attributeRange third.
			stop >= start ifTrue:
				[ attribute isCollection
					ifFalse:
						[ text addAttribute: attribute from: start to: stop ]
					ifTrue:
						[ text addAllAttributes: attribute from: start to: stop ] ] ] ].
	
	^ text
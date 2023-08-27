support
messagesFromText: aText

	| steps |
	steps := Array streamContents: [:stream |
		aText runs withStartStopAndValueDo: [:start :stop :attributes |
			((attributes includes: TextEmphasis bold)
				and: [stop - start > 1 and: [(aText at: stop) = $:]])
					ifTrue:
						[stream nextPut: {start. stop}]]].
	^ (((steps copyWith: {aText size + 1. nil}))
		overlappingPairsCollect: [:step :nextStep |
			| start sep stop role content message |
			start := step first.
			sep := step second.
			stop := nextStep first - 1.
			
			role := (aText copyFrom: start to: sep - 1)
				asString asLegalSelector.
			content := (aText copyFrom: sep + 1 to: stop)
				asString withBlanksTrimmed.
			content := content copyWithout: (Character value: 0). "reserved #cursorText for streaming messages"
			message := SemanticMessage role: role content: content.
			
			(start to: stop) -> message])
		as: OrderedDictionary
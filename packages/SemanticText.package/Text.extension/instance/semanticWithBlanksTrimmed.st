*SemanticText-Tools-Conversation-converting
semanticWithBlanksTrimmed
	"Return a copy of the receiver from which leading and trailing blanks have been trimmed."

	| nonSeparators first last |
	self flag: #moveUpstream. "Preserve Character startOfHeader"
	
	nonSeparators := [CharacterSet nonSeparators copyWith: Character startOfHeader] once.
	first := string indexOfAnyOf: nonSeparators startingAt: 1.
	first = 0 ifTrue: [ ^Text new ].  "no non-separator character"
	last := string lastIndexOfAnyOf: nonSeparators startingAt: self size ifAbsent: [self size].
	(first = 1 and: [ last = self size ]) ifTrue: [ ^self copy ].
	^self
		copyFrom: first
		to: last
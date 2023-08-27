*SemanticText-Model-Conversation-ui support-mvc compatibility-pseudo-override
zapSelectionWith: replacement invisibly: invisibly

	| start stop rep |
	morph readOnly ifTrue: [^ self].
	start := self startIndex.
	stop := self stopIndex.
	(replacement isEmpty and: [stop > start]) ifTrue: [
		"If deleting, then set emphasisHere from 1st character of the deletion"
		emphasisHere := (self text attributesAt: start) select: [:att | att mayBeExtended]].
	(start = stop and: [ replacement isEmpty ]) ifFalse: [
		morph plainTextOnly
			ifTrue: [
				"We support TextAlignment but nothing else. Rely on emphasisHere."
				rep := Text string: replacement asString attributes: emphasisHere ]
			ifFalse: [ replacement isText
				ifTrue: [ rep := replacement]
				ifFalse: [ rep := Text string: replacement attributes: emphasisHere ] ].
		
		self text replaceFrom: start to: stop - 1 with: rep.
		paragraph
			recomposeFrom: start
			to:  start + rep size - 1
			delta: rep size - (stop-start).
		self markIndex: start pointIndex: start + rep size.
		otherInterval := self selectionInterval].
	
	invisibly ifFalse: [
		self userHasEdited  " -- note text now dirty"].
*SemanticText-Model-matching-override
matchAgainstBranch: anRxmBranch nextLink: nextLink alternativeLink: alternativeLink
	"Greedy matching."

	| position result |
	self flag: #workaround. "Temporarily reverted from ul 11/15/2025 18:45 due to regression. See: https://lists.squeakfoundation.org/archives/list/squeak-dev@lists.squeakfoundation.org/message/KA5Y6M3BT7OX5B7PNQMNIR6MUMIQKEBZ/"
	
	"Detect infinite empty backloops from nested links."
	position := stream position.
	branchPositions
		at: anRxmBranch
		ifPresent: [:positions | (positions includes: position) ifTrue: [
			"We already had this situation earlier in the current stack, don't retry again"
			self flag: #ct. "I was struggling to produce formal evidence that there can be no matching chain of links where the first occurence of a link would not advance the cursor but the second occurence would actually constitute a match. The only example of which I could think would be some side effect like ^a(\1?)*$ to match 'aa', but apparently no other popular regex engine is able to handle this, too. Also, support for backreferences is yet on my to-do list. :-) Can there be any other violation?"
			^ false]].
	
	"Remember the current position for this branch to enable detection of infinite empty backloops."
	(branchPositions at: anRxmBranch ifAbsentPut: [OrderedCollection new]) add: position.
	
	result := (nextLink matchAgainst: self)
		or: [alternativeLink notNil and: [alternativeLink matchAgainst: self]].
	
	(branchPositions at: anRxmBranch) remove: position.
	
	^ result
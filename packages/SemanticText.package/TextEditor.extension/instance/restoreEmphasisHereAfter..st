*SemanticText-Model-Conversation-ui support-accessing-pseudo-override
restoreEmphasisHereAfter: aBlock

	| priorEmphasis |
	priorEmphasis := emphasisHere.
	^ aBlock ensure: [
		emphasisHere := priorEmphasis]
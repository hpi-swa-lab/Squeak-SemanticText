*SemanticText-Tools-Conversation-browsing
openAndComplete

	| window |
	window := self open.
	(window model future: 1) completeAsIs. "must defer this after first world cycle!"
	^ window
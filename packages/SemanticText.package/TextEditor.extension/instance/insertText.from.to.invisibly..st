*SemanticText-Model-Conversation-ui support-accessing-pseudo-override
insertText: newText from: start to: stop invisibly: invisibly

	| priorSelection |
	priorSelection := self selectionInterval.
	self selectInvisiblyFrom: start to: stop.
	
	self restoreEmphasisHereAfter: [
		self setEmphasisHere.
		self replaceSelectionWith: newText invisibly: invisibly].
	
	invisibly ifFalse: [^ self].
	
	"Restore previous selection. Also update it if behind insertion."
	priorSelection start >= start ifTrue: [
		priorSelection := priorSelection start + newText size - (stop - start) - 1 to: priorSelection stop].
	priorSelection stop >= start ifTrue: [
		priorSelection := priorSelection start to: priorSelection stop + newText size - (stop - start) - 1].
	self selectInvisiblyFrom: priorSelection start to: priorSelection stop.
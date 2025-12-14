*SemanticText-Model-Conversation-ui support-model access-pseudo-override
insertText: newText toReplace: oldTextOrNil invisibly: invisibly
	"if oldTextOrNil is nil, append the text to the end"

	| fullText start |
	fullText := textMorph text.
	^ (oldTextOrNil notNil and: [
		(oldTextOrNil notNil and: [oldTextOrNil isEmpty])
			ifTrue: [start := 1]
			ifFalse:
				[start := fullText findString: oldTextOrNil.
				oldTextOrNil isText ifTrue:
					[[start > 0 and: [((fullText attributesAt: start) includesAllOf: (oldTextOrNil attributesAt: 1)) not]] whileTrue:
						[start := fullText findString: oldTextOrNil startingAt: start + 1]]].
		start > 0])
			ifFalse: [(self "haltIf: oldTextOrNil notNil") insertText: newText from: fullText size + 1 to: fullText size invisibly: invisibly]
			ifTrue: [self insertText: newText from: start to: start + oldTextOrNil size - 1 invisibly: invisibly]
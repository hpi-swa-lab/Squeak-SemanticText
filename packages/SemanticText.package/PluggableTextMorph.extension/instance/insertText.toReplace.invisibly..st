*SemanticText-Model-Conversation-ui support-model access-pseudo-override
insertText: newText toReplace: oldTextOrNil invisibly: invisibly
	"if oldTextOrNil is nil, append the text to the end"

	| start |
	^ (oldTextOrNil notNil and: [
		(start := textMorph text findString: oldTextOrNil) > 0])
			ifFalse: [self insertText: newText from: textMorph text size + 1 to: textMorph text size invisibly: invisibly]
			ifTrue: [self insertText: newText from: start to: start + oldTextOrNil size - 1 invisibly: invisibly]
converting
asToolMessageWithResult: result

	^ SemanticToolMessage
		toolCall: self
		content: result
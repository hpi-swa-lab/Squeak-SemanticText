instance creation
toolCall: aToolCall content: anObject

	^ self new
		role: #tool;
		toolCall: aToolCall;
		content: anObject;
		yourself
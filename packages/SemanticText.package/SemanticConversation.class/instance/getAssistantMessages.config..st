completing
getAssistantMessages: number config: aConfigOrNil
	"Retrieve <number> new assistant messages from the model, store each of them in a copy of the receiver, and return the new messages.
	NB: The new messages might contained unresolved tool calls. To automatically resolve and feed them back to the model, send #getCompleteAssistantMessages: instead."

	| effectiveConfig responses |
	self assert: self currentStreamingMessage isNil.
	
	effectiveConfig := self config.
	aConfigOrNil ifNotNil:
		[effectiveConfig := effectiveConfig updatedWith: aConfigOrNil].
	
	responses := self popToolSpecDuring:
		[self model getAnswers: number for: self config: effectiveConfig].
	^ responses collect: [:response |
		self copy addMessage: response. "NB: we must decouple the new messages from the receiver to make it independent from further side effects. For example, see SemanticMessage>>estimateExpense."
		response]
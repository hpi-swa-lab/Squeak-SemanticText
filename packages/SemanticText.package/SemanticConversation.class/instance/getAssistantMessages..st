assistant
getAssistantMessages: number
	"Retrieve <number> new assistant messages from the model, store each of them in a copy of the receiver, and answer the new messages."

	| responses |
	responses := self popToolSpecDuring:
		[self model getAnswers: number for: self config: config].
	^ responses collect: [:response |
		self copy addMessage: response. "NB: we must decouple the new messages from the receiver to make it independent from further side effects. For example, see SemanticMessage>>estimateExpense."
		response]
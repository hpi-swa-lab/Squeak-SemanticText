server events - responses
handleResponseCreated: event
	<serverEvent: #'response.created'>

	| messagePromise responsePromise constructionId completion |
	currentResponses add: event response id.
	
	messagePromise := self
		semanticFutureWhen: #newResponseMessage
		with: event response id
		until: #stopped.
	responsePromise := event response status = 'in_progress'
		ifTrue:
			[Promise race:
				{self semanticFutureWhen: #'response.done' with: event response id until: #stopped.
				self semanticFutureUntil: #'response.cancelled' with: event response id}]
		ifFalse: [Promise unit: event response id].
	messagePromise := Promise race: {messagePromise. responsePromise}.
	messagePromise := messagePromise >>= [:message |
		message
			propertyValueAt: #responseCompleted put: responsePromise;
			yourself].
	
	constructionId := event response metadata ifNotNil: [:meta | meta constructionId].
	constructionId ifNotNil:
		["ack only"
		^ self
			triggerEvent: #'response.created'
			withArguments: {constructionId. messagePromise}].
	
	event response status = #cancelled ifTrue:
		[self conversation triggerEvent: #responseCancelled withArguments:
			{event response id.
			event response status_details reason = 'turn_detected' ifTrue: [Error new tag: #responseInterrupted]}].
	
	completion := SemanticConversationCompletion newFor: self conversation config: nil.
	completion startRecordPendingToolCalls.
	self conversation streamDoing:
		[(messagePromise ifRejected: ["response was legitimately canceled"]) wait
			ifNotNil: [completion completeConversationAsIs: true]].
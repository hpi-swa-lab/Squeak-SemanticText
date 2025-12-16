server events
handleResponseCreated: event
	<serverEvent: #'response.created'>

	| messagePromise responsePromise constructionId completion |
	currentResponses add: event response id.
	
	messagePromise := self
		semanticFutureWhen: #newResponseMessage
		with: event response id
		until: #stopped.
	responsePromise := event response status = 'in_progress'
		ifTrue: [self semanticFutureWhen: #'response.done' with: event response id until: #stopped]
		ifFalse: [Promise unit: event response id].
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
		[self conversation triggerEvent: #responseCancelled].
	
	completion := SemanticConversationCompletion newFor: self conversation config: nil.
	completion startRecordPendingToolCalls.
	self conversation streamDoing:
		[messagePromise wait.
		completion completeConversationAsIs: true].
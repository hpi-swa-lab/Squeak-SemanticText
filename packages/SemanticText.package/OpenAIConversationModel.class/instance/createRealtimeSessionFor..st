service
createRealtimeSessionFor: aConversation

	self isRealtimeModel ifFalse: [^ self error: 'This model does not support realtime sessions'].
	^ OpenAIRealtimeSession newFor: aConversation model: self
completing
completeConversationAsIs: aBoolean config: aConfigOrNil
	"Completed the receiver with a new full assistant message retrieved from the model. If the assistant requests tool calls, these are automatically resolved and fed back to the model. No infinite loop protection!
	
	If aBoolean is true, assume an new assistant message has already been added and only complete it if necessary."

	self shouldStream = true ifFalse:
		[^ self completeConversationNowAsIs: aBoolean config: aConfigOrNil].
	
	self streamDoing:
		[self completeConversationNowAsIs: aBoolean config: aConfigOrNil].
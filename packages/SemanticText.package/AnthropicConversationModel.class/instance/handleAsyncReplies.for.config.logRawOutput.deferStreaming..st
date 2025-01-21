private
handleAsyncReplies: number for: aConversation config: aConfig logRawOutput: logRawOutput deferStreaming: deferBlock
	"Black magic that esssentially implements a coroutine to answer a streaming conversation BEFORE returning control to the sender's sender (#invokeWithConfig:editInput:handleResponse:) and only then resumes the invocation and request processing from the background streaming process."

	| context home continue sem result |
	"Preserve the remaining invocation stack..."
	context := thisContext sender.
	home := context home.
	continue := context sender cut: home.
	context privSender: home.
	sem := Semaphore new.
	
	"...directly return the streaming answers..."
	result := self
		handleStreamingReplies: number
		for: aConversation
		from:
			["...and continue the invocation stack from the requestBlock."
			| streamContext |
			streamContext := thisContext.
			sem wait.
			self assert: home isDead.
			home privSender: streamContext; pc: home endPC.
			deferBlock value: [:response | streamContext push: response; jump].
			continue privSender: streamContext.
			continue push: nil; jump]
		config: aConfig
		logRawOutput: logRawOutput.
	
	"If the activeProcess has a lower priority than the default streaming priority, the streaming process must wait for the activeProcess to return from home."
	home insertSender:
		(Context contextEnsure: [sem signal]).
	
	^ result
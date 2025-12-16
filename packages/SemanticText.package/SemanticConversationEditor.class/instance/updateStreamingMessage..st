updating - conversation
updateStreamingMessage: aMessage

	self future changed: #isStreamingResponse.
	(aMessage isStreaming and: [aMessage isComplete not]) ifFalse:
		[^ self noteMessageCompleted: self conversation lastMessage wasStreaming: true].
	
	"self future changed: #text."
	self future changed: #text with: self text. "if we determine the text later it might contain chunks that we will still add later - should we maintain one shared queue of chunks and delete them in this future send? that would also be more efficient"
	self flag: #bug. "after a message is canceled we might receive later chunks that are added to the next user message - the queue approach discussed above could fix this"
	
	aMessage sendUpdatesFromTextModel: self selector: #text.
	aMessage toolCalls do: [:toolCall |
		toolCall sendUpdatesFromTextModel: self selector: #text].
	aMessage when: #newToolCall send: #updateStreamingToolCall: to: self.
	
	aMessage isAssistantMessage ifTrue:
		[aMessage
			when: #newSoundChunk
			send: #sayStreamingMessageAudio:at:
			to: self voiceAutomaton].
	aMessage when: #completed send: #noteStreamingMessageCompleted: to: self with: aMessage.
	
	self flag: #todo. "Auto-scrolling unless the user has started to scroll away would be great"
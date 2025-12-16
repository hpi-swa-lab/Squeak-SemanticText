private
startRealtimeSessionFromUser: aBoolean

	self text: self editText. "Preserve changes before #startRealtimeSession might trigger a change for a new system message that reverts them"
	self conversation lastMessage ifNotNil: [:message |
		message content isNil ifTrue:
			[self conversation messages: self conversation messages allButLast]].
	Cursor wait showWhile:
		[self conversation startRealtimeSession].
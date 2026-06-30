toolbuilder
helpForVoice

	thisContext insertSender: (Context contextOn: Error , Warning , Halt do: [:ex | ^ ex asString]).
	
	self voiceModeEnabled ifFalse: [^ nil].
	
	^
'Listening... (press again to stop)

Commit recording with Shift + drag
Cancel recording with Cmd + drag'
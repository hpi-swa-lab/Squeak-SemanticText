accessing
lastToolCallMessageOrNil

	| message |
	message := self lastMessage ifNil: [^ nil].
	message hasToolCalls ifFalse: [^ nil].
	^ message
accessing
lastToolCallMessageOrNil

	^ self messages reversed
		detect: [:message | message hasToolCalls]
		ifNone: [nil]
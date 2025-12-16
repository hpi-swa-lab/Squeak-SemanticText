private - events
sendClientEvent: type result: resultType resultKey: resultKeyOrNil with: json

	| event promise |
	self flag: #todo. "commit fix in Promise>>#shallowCopy"
	promise := resultKeyOrNil
		ifNotNil: [self semanticFutureWhen: resultType with: resultKeyOrNil until: #stopped]
		ifNil: [self semanticFutureWhen: resultType until: #stopped].
	event := self sendClientEvent: type with: json.
	promises at: event event_id put: promise.
	^ promise
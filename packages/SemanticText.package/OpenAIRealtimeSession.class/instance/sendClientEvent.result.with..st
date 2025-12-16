private - events
sendClientEvent: type result: resultType with: json

	^ self
		sendClientEvent: type
		result: resultType
		resultKey: nil
		with: json
private - events
sendClientEvent: type result: resultType

	^ self
		sendClientEvent: type
		result: resultType
		with: JsonObject new
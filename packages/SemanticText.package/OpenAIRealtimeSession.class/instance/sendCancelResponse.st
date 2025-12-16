client events
sendCancelResponse

	^ self
		sendClientEvent: #'response.cancel'
		result: #'response.done'
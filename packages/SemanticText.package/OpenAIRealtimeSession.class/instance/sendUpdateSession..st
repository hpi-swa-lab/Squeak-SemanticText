client events
sendUpdateSession: properties

	^ self sendClientEvent: #'session.update' result: #'session.updated' with:
		(JsonObject new
			session: properties;
			yourself)
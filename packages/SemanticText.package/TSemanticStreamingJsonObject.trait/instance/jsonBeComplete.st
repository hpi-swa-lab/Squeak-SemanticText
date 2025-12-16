private
jsonBeComplete

	self basicComplete: true.
	self triggerEvent: #completed.
	self valuesDo: [:value |
		(value isDictionary and: [value semanticIsStreamingJson] and: [value jsonIsComplete not]) ifTrue:
			[self halt "somehow raise error in consumer... maybe make the api execute aroudn blocks?"]].
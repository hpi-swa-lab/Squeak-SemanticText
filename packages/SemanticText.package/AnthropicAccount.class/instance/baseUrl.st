accessing
baseUrl

	^ baseUrl ifNil: [self defaultBaseUrl]
scripts
postLoad

	self isCI ifTrue: [^ self].
	
	OpenAIAccount defaultApiKey isEmptyOrNil ifTrue:
		[self openWelcomeContents].
support
assureAvailableOr: requirementsBlock

	self account ifNil:
		[^ requirementsBlock value:
			{{#openAIAccount. 'provide an OpenAI account'. [self inspect]}}].
	
	self account hasApiKey ifFalse:
		[^ requirementsBlock value:
			{{#openAIAccount. 'provide an OpenAI API key'. [PreferenceBrowser open searchPattern: 'OpenAI API']}}].
	
	^ nil
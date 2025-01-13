support
assureAvailableOr: requirementsBlock

	self account ifNil:
		[^ requirementsBlock value:
			{{#openAIAccount. 'provide an Anthropic account'. [self inspect]}}].
	
	self account hasApiKey ifFalse:
		[^ requirementsBlock value:
			{{#openAIAccount. 'provide an Anthropic API key'. [PreferenceBrowser open searchPattern: 'Anthropic API']}}].
	
	^ nil
initialize-release
addWelcomeMessageTo: aConversation

	aConversation addAssistantMessage: 'Welcome to ChatGPT! Enter any question you have below and press Complete (Cmd + S) to submit it. [Learn more] [Don''t show again]'.
	
	self flag: #hacked. "maybe support true formatted texts in messages instead?"
	(messageMarkups ifNil: [messageMarkups := WeakIdentityKeyDictionary new])
		at: aConversation lastMessage put:
			(Dictionary new
				at: '[Learn more]' put: [self showHelp];
				at: '[Don''t show again]' put: [self dontShowWelcomeMessage];
				collect: [:action |
					{TextEmphasis underlined.
					PluggableTextAttribute evalBlock: action}]).
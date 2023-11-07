actions
dontShowWelcomeMessage

	self class shouldShowWelcomeMessage: false.
	self okToChange ifTrue:
		[self conversation messages removeFirst.
		self
			changed: #text;
			addUserMessage].
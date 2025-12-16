private - conversation
addMessageFromServer: aMessage

	^ self editMessagesFromServer:
		[existingIds add: aMessage id.
		self conversation addMessage: aMessage]
requests
retrieveConversationItemWithId: id

	^ (self sendConversationItemRetrieve: id) wait
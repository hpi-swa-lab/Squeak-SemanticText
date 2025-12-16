requests
retrieveAllConversationItems
	"For debugging"

	| possibleIds |
	self flag: #forLater. "also make it possible to reoncstruct entire conversation from this
	depending on what we want to do with this, we might want to reuse existing message objects after comparing their properties?"
	
	possibleIds := ((eventLog collect: [:event | event item_id ifNil: [event item ifNotNil: [:item | item id]]])
		copyWithoutAll: #(nil root))
			withoutDuplicates.
	^ (possibleIds semanticConcurrentCollect: [:id |
		[self retrieveConversationItemWithId: id]
			on: OpenAIError do: [:ex |
				ex code = 'item_retrieve_invalid_item_id' ifTrue: [ex return: nil].
				ex pass]])
			copyWithout: nil
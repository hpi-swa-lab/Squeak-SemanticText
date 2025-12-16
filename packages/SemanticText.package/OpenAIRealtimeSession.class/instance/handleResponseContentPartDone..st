server events - responses
handleResponseContentPartDone: event
	<serverEvent: #'response.content_part.done'>

	| message |
	message := self messageWithId: event item_id.
	self logEvent: event forItem: message.
	
	"only complete the message in #handleResponseOutputItemDone: because it might contain multiple content parts"
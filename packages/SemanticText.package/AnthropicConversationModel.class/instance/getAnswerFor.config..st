service
getAnswerFor: aConversation config: aConfigOrNil
	"Generate an assistant reply in response to aConversation. Answer a new SemanticMessage for the new reply. If #shouldStream is set to true, the answer will be SemanticStreamingMessage that is completed in the background."

	^ (self getAnswers: 1 for: aConversation config: aConfigOrNil) first
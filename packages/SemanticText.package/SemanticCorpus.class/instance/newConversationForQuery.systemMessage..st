search - conversation
newConversationForQuery: aString systemMessage: systemMessageOrNil
	"Simple retrieval-automated generation (RAG) implementation. See: https://github.com/openai/openai-cookbook/blob/main/examples/Question_answering_using_embeddings.ipynb"

	| conversation |
	self flag: #forLater. "Improve quality of results:
	* try prompt engineering (different phrases, order of inputs/repetition)
	* better embeddings through better search terms in function calls, fictive answers, or even fictive questions for each document (HyDE)
	* interface: more flexible prompts
	* reference used sources (could assign a number to each document and tell the assistant to return the used numbers)"
	
	conversation := SemanticConversation newStreaming.
	conversation updateConfig: [:config |
		config temperature: 0].
	systemMessageOrNil ifNotNil:
		[conversation addSystemMessage: systemMessageOrNil].
	conversation addFunction: 'search(query: string "e.g., \"apple\" or \"how to bake apple pie\"")' argsAction: [:query |
		self findDocuments: 10 similarToQuery: query collect: [:document | document text]].
	"conversation pushTools: #() force: #(search)."
	conversation addUserMessage: aString.
	conversation completeConversation.
	^ conversation
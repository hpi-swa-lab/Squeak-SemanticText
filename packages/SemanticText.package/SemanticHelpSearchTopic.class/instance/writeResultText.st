searching
writeResultText

	results ifNil: [^ resultText].
	
	resultText append: ('<b>Semantic search results (experimental, powered by AI)</b><br><br>{1}<br><br>' asTextFromHtml format:
		{searchRequirements
			ifNotNil:
				['<i>To enable semantic search (experimental, powered by AI), you need to {1}. {2}</i>' asTextFromHtml format:
					{SemanticText
						formatRequirements: searchRequirements
						retry: [self startSearch].
					'Click here to retry.' asText
						addAttribute: (PluggableTextAttribute evalBlock: [self startSearch]);
						yourself}]
			ifNil:
				[resultTopics
					ifNil: ['...']
					ifNotNil: ['See subtopics in the left pane.' asTextFromHtml]]}).
	
	resultTopics ifNotNil:
		[(self shouldGenerateReply or: [resultConversation notNil] or: [conversationRequirements notNil])
			ifFalse:
				[resultText append:
					('[Generate smart reply]' asText
						addAttribute: (PluggableTextAttribute evalBlock: [self generateReply]);
						yourself)]
			ifTrue:
				[conversationRequirements
					ifNotNil:
						[resultText append:
							('<i>To enable smart replies, you need to {1}. {2}</i>' asTextFromHtml format:
								{SemanticText
									formatRequirements: conversationRequirements
									retry: [self generateReply].
								'Click here to retry.' asText
									addAttribute: (PluggableTextAttribute evalBlock: [self generateReply]);
									yourself})]
					ifNil:
						[resultText append: '<b>Smart reply (experimental, powered by AI)</b><br><br>' asTextFromHtml.
						resultConversation ifNotNil:
							[| messages separator |
							messages := resultConversation messages select: [:message |
								message isAssistantMessage and: [message content isEmptyOrNil not]].
							separator := String cr, String cr.
							messages
								do: [:message | resultText append: message content]
								separatedBy: [resultText append: separator].
							"ensure #cursorText while streaming conversation to reduce flickering"
							(resultConversation isStreaming and: [resultConversation isComplete not]) ifTrue:
								[(resultText endsWith: resultConversation cursorText) ifFalse:
									[resultText append: resultConversation cursorText]].
							resultText append: separator.
							resultText append:
								('[Chat]' asText
									addAttribute: (PluggableTextAttribute evalBlock: [resultConversation open]);
									yourself)]]].
	
		resultText append: String cr, String cr].
	
	resultText append: '<b>Full text search results</b><br>' asTextFromHtml.
	super writeResultText.
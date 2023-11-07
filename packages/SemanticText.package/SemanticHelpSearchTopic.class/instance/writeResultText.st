searching
writeResultText

	results ifNil: [^ resultText].
	
	resultText append: ('<b>Semantic search results (experimental, powered by AI)</b><br><br>{1}<br><br>' asTextFromHtml format:
		{searchRequirements
			ifNotNil:
				['<i>To enable semantic search (experimental, powered by AI), you need to {1}.</i>' asTextFromHtml format:
					{SemanticText
						formatRequirements: searchRequirements
						retry: [self startSearch]}]
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
							('<i>To enable smart replies, you need to {1}.</i>' asTextFromHtml format:
								{SemanticText
									formatRequirements: conversationRequirements
									retry: [self startSearch]})]
					ifNil:
						[resultText append: '<b>Smart reply (experimental, powered by AI)</b><br><br>' asTextFromHtml.
						resultConversation ifNotNil:
							[resultText append: resultConversation lastMessage content , String cr, String cr.
							resultText append:
								('[Chat]' asText
									addAttribute: (PluggableTextAttribute evalBlock: [resultConversation open]);
									yourself)]]].
	
		resultText append: String cr, String cr].
	
	resultText append: '<b>Full text search results</b><br>' asTextFromHtml.
	super writeResultText.
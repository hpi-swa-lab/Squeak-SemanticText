searching
writeResultText

	results ifNil: [^ resultText].
	
	self shouldGenerateReply ifTrue:
		[resultText append: '<b>Smart reply (experimental, powered by AI)</b><br><br>' asTextFromHtml.
		resultConversation ifNotNil:
			[resultText append: resultConversation messages last content , String cr, String cr.
			resultText append:
				('[Chat]' asText
					addAttribute: (PluggableTextAttribute evalBlock: [resultConversation open]);
					yourself)].
		resultText append: String cr, String cr].
	
	resultText append: ('<b>Semantic search results (experimental, powered by AI)</b><br><br>{1}<br><br>' asTextFromHtml format:
		{resultTopics
			ifNil: ['...']
			ifNotNil: ['See subtopics in the left pane.' asTextFromHtml]}).
	
	resultText append: '<b>Full text search results</b><br>' asTextFromHtml.
	super writeResultText.
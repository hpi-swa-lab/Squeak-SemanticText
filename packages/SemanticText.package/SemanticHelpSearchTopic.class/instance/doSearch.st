searching
doSearch

	self concurrentlyDoAll:
		{[super doSearch].
		
		[self doSemanticSearch.
		self shouldGenerateReply ifTrue:
			[self generateReply]]}.
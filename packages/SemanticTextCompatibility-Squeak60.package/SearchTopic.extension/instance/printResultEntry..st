*SemanticTextCompatibility-Squeak60-searching-pseudo-override
printResultEntry: entry

	| resultEntry topicPath topic |
	resultEntry := '' asText.
	topicPath := entry first.
	topic := topicPath last.
	
	resultEntry append:
		(topic title asText
			addAttribute: TextEmphasis bold;
			yourself).
	entry second ifNotNil: [:titleHitInterval |
		resultEntry
			addAttribute: (TextColor color: Color green muchDarker)
			from: titleHitInterval first
			to: titleHitInterval last].

	resultEntry append: ' ' asText , ('({1})' asText
		addAttribute: (PluggableTextAttribute evalBlock: [
			| contentHitInterval |
			self changed: #searchResultSelected with: topicPath.
			contentHitInterval := entry sixth.
			self changed: #searchResultContentsSelected with: contentHitInterval]);
		format: {'open topic' translated}).
	
	resultEntry append: String cr.
	
	resultEntry append: (
		('> ', ((topicPath allButLast collect: [:t | t title]) joinSeparatedBy: ' > ')) asText
			addAttribute: (TextColor color: (Color gray: 0.7))).

	resultEntry append: String cr.
	
	entry fourth ifNil: [resultEntry append: '\\' withCRs] ifNotNil: [:contentHitText |
		| text contentHitInterval |
		text := contentHitText asText.
		contentHitInterval := entry third.
		text
			addAttribute: (TextColor color: Color green muchDarker)
			from: contentHitInterval first
			to: contentHitInterval last;
			addAttribute: TextEmphasis bold
			from: contentHitInterval first
			to: contentHitInterval last.
		resultEntry
			append: text withBlanksTrimmed;
			append: '\\' withCRs].
	
	^ resultEntry
toolbuilder
helpForComplete

	| help |
	thisContext insertSender: (Context contextOn: Error , Warning , Halt do: [:ex | ^ ex asString]).
	
	help := 'Complete this conversation (s)'.
	
	self metricsForCompletion in: [:metrics |
		help := help asText ,
			('<br><br>This will use <b>ca. {1} input tokens{2}</b>{3} and generate up to <b>{4} output tokens.</b>' asTextFromHtml format:
				{metrics at: #promptTokens.
				(metrics at: #promptAudioTokens) > 0 ifFalse: [''] ifTrue:
					[' + {1} audio input tokens' format:
						{metrics at: #promptAudioTokens}].
				(metrics at: #maxTokens) isInfinite ifTrue: [''] ifFalse:
					[(' (which is <b>{1}% of the {2} context window</b>)' semanticAsTextFromHtmlKeepNewlines format:
						{((metrics at: #promptTokenFraction) * 100) printShowingDecimalPlaces: 2.
						(metrics at: #maxTokens) in: [:maxTokens |
							(maxTokens // 1000) asString , 'K']})
							addAllAttributes:
								((metrics at: #promptTokenFraction) > 1
									ifTrue: [{TextColor red}]
									ifFalse: [#()]);
							yourself].
				metrics at: #maxCompletionTokens}).
		(metrics at: #priceRange) ifNotNil: [:minMaxPrice |
			help := help asText ,
				('<br>This will cost <b>between {1} and {2}</b> (depending on the length of the completed message).' asTextFromHtml format:
					{minMaxPrice first. minMaxPrice second})].
		(metrics at: #totalExpense) in: [:expense |
			help := help asText ,
				('<br><br>The conversation so far has cost <b>{1}.</b>' asTextFromHtml format:
					{expense ifNil: ['nothing'] ifNotNil: ['{1}' format: {expense}]})]].
	
	^ help
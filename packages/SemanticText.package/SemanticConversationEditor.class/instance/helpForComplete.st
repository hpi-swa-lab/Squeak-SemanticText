toolbuilder
helpForComplete

	| help |
	thisContext insertSender: (Context contextOn: Error , Warning , Halt do: [:ex | ^ ex asString]).
	
	help := 'Complete this conversation (s)'.
	
	self metricsForCompletion in: [:metrics |
		help := help asText ,
			('<br><br>This will use <b>{1} input tokens</b>{2} and generate up to <b>{3} output tokens.</b>' withCRs asTextFromHtml format:
				{metrics at: #promptTokens.
				(metrics at: #maxTokens) isInfinite ifTrue: [''] ifFalse:
					[(' (which is <b>{1}% of the {2} context window</b>' asTextFromHtml format:
						{((metrics at: #promptTokenFraction) * 100) printShowingDecimalPlaces: 2.
						(metrics at: #maxTokens) in: [:maxTokens |
							(maxTokens // 1000) asString , 'K']})
							addAllAttributes:
								((metrics at: #promptTokenFraction) > 1
									ifTrue: [{TextColor red}]
									ifFalse: [#()]);
							yourself].
				metrics at: #maxCompletionTokens}).
		(metrics at: #price) ifNotNil: [:price |
			help := help asText ,
				('<br>This will cost <b>up to {1}</b> (depending on the length of the completed message).' withCRs asTextFromHtml format:
					{price})].
		(metrics at: #totalExpense) in: [:expense |
			help := help asText ,
				('<br><br>The conversation so far has cost <b>{1}.</b>' withCRs asTextFromHtml format:
					{expense ifNil: ['nothing'] ifNotNil: ['{1}' format: {expense}]})]].
	
	^ help
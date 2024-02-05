toolbuilder
helpForComplete

	| help |
	help := 'Complete this conversation (s)'.
	
	self metricsForCompletion in: [:metrics |
		help := help asText ,
			('<br><br>This will use <b>{1} input tokens</b> (which is {2}) and generate up to <b>{3} output tokens.</b>' withCRs asTextFromHtml format:
				{metrics at: #promptTokens.
				('<b>{1}% of the {2} context window</b>' asTextFromHtml format:
					{((metrics at: #promptTokenFraction) * 100s1) printFractionAsDecimal.
					((metrics at: #maxTokens) // 1000) asString , 'K'})
						addAllAttributes:
							((metrics at: #promptTokenFraction) > 1
								ifTrue: [{TextColor red}]
								ifFalse: [#()]);
						yourself.
				metrics at: #maxCompletionTokens}).
		(metrics at: #price) ifNotNil:[:price |
			help := help asText ,
				('<br>This will cost <b>up to {1}</b> (depending on the length of the completed message).' withCRs asTextFromHtml format:
					{price})]].
	
	^ help
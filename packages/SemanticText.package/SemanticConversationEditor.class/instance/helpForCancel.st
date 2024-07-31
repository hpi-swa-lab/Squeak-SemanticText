toolbuilder
helpForCancel

	| help |
	thisContext insertSender: (Context contextOn: Error , Warning , Halt do: [:ex | ^ ex asString]).
	
	help := 'Cancel current completion'.
	
	self metricsForCompletion in: [:metrics |
		(metrics at: #totalExpense) in: [:expense |
			help := help asText ,
				('<br><br>The conversation so far has cost <b>{1}.</b>' asTextFromHtml format:
					{expense ifNil: ['nothing'] ifNotNil: ['{1}' format: {expense}]})]].
	
	^ help
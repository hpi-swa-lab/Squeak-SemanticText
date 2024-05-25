as yet unclassified
validate

	^ Array streamContents: [:errorStream |
		self messages withIndexDo: [:message :index |
			| toolMessages |
			toolMessages := Array streamContents: [:messageStream |
				self messages readStream
					skip: index;
					in: [:s |
						[s atEnd not and: [s peek isToolMessage]] whileTrue:
							[messageStream nextPut: s next]]].
			message toolCalls do: [:toolCall |
				toolMessages
					detect: [:toolMessage | toolMessage toolCall == toolCall]
					ifNone: [errorStream nextPut: {#unresolvedToolCall. message. toolCall}]]]]
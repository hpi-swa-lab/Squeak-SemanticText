private
generateReplyFor: aConversation

	| endWords messages startWords |
	messages := aConversation messages.
	startWords := messages collect: [:message |
		message content substrings at: 1 ifAbsent: [nil]].
	endWords := messages collect: [:message |
		message content substrings atLast: 1 ifAbsent: [nil]].
	^  'I''m sorry, but I can''t help you with your request, since I am just a stupid mock model. However, I can tell you that this conversation contains {1}{2}.

Is there anything else I can do for you?' format:
		{('{1} earlier message' asPluralBasedOn: messages size)
			format: {messages size}.
		messages ifEmpty: [''] ifNotEmpty:
			[' that started with the {1} {2} and ended with the {3} {4}' format:
				{'word' asPluralBasedOn: startWords size.
				(startWords collect: [:word |
					word ifNil: ['<nil>'] ifNotNil: ['"{1}"' format: {word}]])
						asCommaStringAnd.
				'word' asPluralBasedOn: endWords size.
				(endWords collect: [:word |
					word ifNil: ['<nil>'] ifNotNil: ['"{1}"' format: {word}]])
						asCommaStringAnd}]}
private
generateReplyTextFor: aConversation config: aConfig

	| endWords messages startWords |
	messages := aConversation messages.
	startWords := messages collect: [:message |
		message content asString substrings at: 1 ifAbsent: [nil]].
	endWords := messages collect: [:message |
		message content asString substrings atLast: 1 ifAbsent: [nil]].
	^ 'I''m sorry, but I can''t help you with your request, since I am just a stupid mock model. However, I can tell you that this conversation contains {1}{2}.{3}

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
						asCommaStringAnd}].
		aConversation activeToolSpec ifNil: [''] ifNotNil: [:toolSpec |
			' I also have access to {1}{2}.' format:
				{('{1} tool' asPluralBasedOn: toolSpec tools size) format:
					{toolSpec tools size}.
				toolSpec tools ifEmpty: [''] ifNotEmpty: [:tools |
					' ({1})' format: {(tools collect: #name) asCommaStringAnd}]}]}
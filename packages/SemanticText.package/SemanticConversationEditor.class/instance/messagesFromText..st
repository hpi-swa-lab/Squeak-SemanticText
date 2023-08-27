private
messagesFromText: aText

	| messages newMessages |
	newMessages := self class messagesFromText: aText.
	
	"^ newMessages"
	"Interface convenience: Attempt to prolong the lifecycle of existing messages by associating them based on the message attributes (optional)."
	messages := OrderedCollection new.
	newMessages keysAndValuesDo: [:interval :newMessage |
		| runMessage runMessages runText |
		runText := aText copyFrom: interval start to: interval stop.
		runMessages := (runText semanticAllAttributes
			select: [:attribute | attribute isKindOf: SemanticConversationEditorMessageAttribute]
			thenCollect: [:attribute | attribute message])
				withoutDuplicates
					copyWithoutAll: messages.
		runMessage := runMessages
			ifNotEmpty:
				[| message |
				message := runMessages first.
				message role: newMessage role.
				message content: newMessage content.
				message]
			ifEmpty:
				[newMessage].
		
		messages addLast: runMessage].
	^ messages
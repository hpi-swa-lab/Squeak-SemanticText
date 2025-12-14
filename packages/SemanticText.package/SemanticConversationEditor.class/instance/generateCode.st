actions
generateCode

	| code currentConversation |
	currentConversation := self conversationFromUserText.
	code := currentConversation asCode.
	^ Project uiManager edit: code label: currentConversation printString shouldStyle: true
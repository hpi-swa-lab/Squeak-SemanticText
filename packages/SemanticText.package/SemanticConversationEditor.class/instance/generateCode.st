actions
generateCode

	| code currentConversation |
	currentConversation := self conversationFromUserText: self editText.
	code := currentConversation asCode.
	^ Project uiManager edit: code label: currentConversation printString shouldStyle: true
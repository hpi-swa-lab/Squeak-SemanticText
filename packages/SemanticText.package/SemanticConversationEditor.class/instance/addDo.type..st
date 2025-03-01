actions
addDo: textBlock type: addType

	| hasUserEdited editText newText |
	addType = #append ifFalse:
		["drop unused user message placeholder"
		(hasUserEdited := self canDiscardEdits not) ifFalse:
			[self changed: #text]].
	editText := self editText.
	
	newText := Text streamContents: [:stream |
		editText ifNotEmpty:
			[stream cr; cr].
		stream nextPutAll: textBlock value].
	
	Smalltalk isMorphic
		ifTrue:
			[self changed: #insertTextReplacement with: {#text. newText. nil. false}. "visibly - so the selection is updated"
			self fixUpEditStringEmphasis.
			(addType = #placeholder and: [hasUserEdited not]) ifTrue:
				[self changed: #clearUserEdits]]
		ifFalse:
			[self changed: #editString with: editText , newText.
			self changed: #clearUserEdits].
	
	self changed: #editText.
	
	"move cursor to end"
	self changed: #textSelection.
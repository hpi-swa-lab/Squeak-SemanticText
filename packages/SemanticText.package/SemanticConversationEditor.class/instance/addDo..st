actions
addDo: textBlock

	| editText newText |
	"drop unused user message placeholder"
	self canDiscardEdits ifTrue:
		[self changed: #text].
	editText := self editText.
	
	newText := Text streamContents: [:stream |
		editText ifNotEmpty:
			[stream cr; cr].
		stream nextPutAll: textBlock value].
	
	Smalltalk isMorphic
		ifTrue:
			[self changed: #insertTextReplacement with: {#text. newText. nil. true}.
			self fixUpEditStringEmphasis]
		ifFalse:
			[self changed: #editString with: editText , newText.
			self changed: #clearUserEdits].
	
	"move cursor to end"
	self changed: #textSelection.
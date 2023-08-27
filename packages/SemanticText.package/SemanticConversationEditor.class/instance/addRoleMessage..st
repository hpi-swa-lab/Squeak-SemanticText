actions
addRoleMessage: role

	| editText message newText |
	editText := self editText.
	
	message := SemanticMessage role: role content: ''.
	newText := Text streamContents: [:stream |
		editText ifNotEmpty:
			[stream cr; cr].
		stream nextPutAll: (self textFromMessages: {message})].
	
	Smalltalk isMorphic
		ifTrue:
			[self changed: #insertTextReplacement with: {#text. newText. nil. true}.
			self fixUpEditStringEmphasis]
		ifFalse:
			[self changed: #editString with: editText , newText.
			self changed: #clearUserEdits].
	
	"move cursor to end"
	self changed: #textSelection.
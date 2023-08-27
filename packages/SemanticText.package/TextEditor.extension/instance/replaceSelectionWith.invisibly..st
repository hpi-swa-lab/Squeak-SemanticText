*SemanticText-Model-Conversation-ui support-undo-pseudo-override
replaceSelectionWith: aText invisibly: invisibly
	"Remember the selection text in UndoSelection.
	 Deselect, and replace the selection text by aText.
	 Remember the resulting selectionInterval in UndoInterval and PriorInterval.
	 Set up undo to use UndoReplace.
	 Unless invisibly, notify the text morph about the change."

	self openTypeIn.
	self zapSelectionWith: aText invisibly: invisibly.
	self closeTypeIn.
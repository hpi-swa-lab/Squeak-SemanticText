accessing
text

	| text |
	text := self textFromMessages: self conversation messages.
	
	self flag: #workaround. "Avoid flickering due to background styling that should happen immediately (see https://lists.squeakfoundation.org/archives/list/squeak-dev@lists.squeakfoundation.org/thread/WL25RTAAEACX4YLY3BVKH4CXKMY27CIY/)"
	^ SemanticConversationEditorStyler new styledTextFor: text
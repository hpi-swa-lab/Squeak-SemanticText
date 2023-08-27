toolbuilder
buildTextPane: builder

	^ builder pluggableTextSpec new
		model: self;
		getText: #text;
		setText: #complete:;
		editText: #editText:;
		selection: #textSelection;
		stylerClass: SemanticConversationEditorStyler;
		flag: #todo; "text is not re-styled after changing emphasis (cmd-7)!"
		yourself
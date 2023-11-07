toolbuilder
addModelItemsToWindowMenu: menu

	super addModelItemsToWindowMenu: menu.
	menu addLine.
	menu defaultTarget: self.
	
	menu
		add: ('choose model... ({1})' format: {self conversation model name})
		action: #chooseModel.
	menu
		add: ('{1}streaming' format: {self isStreaming ifTrue: ['<on>'] ifFalse: ['<off>']})
		action: #toggleStreaming.
	
	menu addLine.
	menu
		add: ('choose default model... ({1})' format: {SemanticText defaultConversationModelOrNil ifNotNil: #name})
		target: SemanticText
		action: #chooseDefaultConversationModel.
	menu
		add: 'edit preferences'
		action: #openPreferences.
	
	menu addLine.
	SemanticText appMenu: menu.
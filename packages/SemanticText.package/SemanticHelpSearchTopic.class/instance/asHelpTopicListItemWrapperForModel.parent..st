HelpSystem-UI
asHelpTopicListItemWrapperForModel: model parent: parent

	| wrapper |
	wrapper := super asHelpTopicListItemWrapperForModel: model parent: parent.
	wrapper becomeForward: (wrapper as: SemanticHelpSearchTopicListItemWrapper). "preserve original instance to keep dependents"
	^ wrapper
as yet unclassified
topicMenu: menu parentTopic: parentTopic

	^ (super topicMenu: menu parentTopic: parentTopic)
		
		addLine;
		add: SemanticText appName subMenu:
			(SemanticText appMenu:
				(ToolBuilder default buildPluggableMenu: ToolBuilder default pluggableMenuSpec new))
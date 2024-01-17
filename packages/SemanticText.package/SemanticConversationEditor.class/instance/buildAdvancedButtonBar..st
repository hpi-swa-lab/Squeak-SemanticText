toolbuilder
buildAdvancedButtonBar: builder

	^ builder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children:
			(OrderedCollection new
				add:
					(builder pluggableActionButtonSpec new
						model: self;
						label: '+Tool spec';
						help: 'Add tool spec';
						action: #addToolSpec;
						yourself);
				add:
					(builder pluggableActionButtonSpec new
						model: self;
						label: '+Tool call';
						help: 'Add tool call';
						action: #addToolCall;
						yourself);
				add:
					(builder pluggableActionButtonSpec new
						model: self;
						label: '+Tool result';
						help: 'Add tool message';
						action: #addToolMessage;
						yourself);
				add:
					(builder pluggableActionButtonSpec new
						model: self;
						label: 'Resolve';
						help: 'Resolve all tool calls';
						action: #resolveAllToolCalls;
						yourself);
				add:
					(builder pluggableActionButtonSpec new
						model: self;
						label: 'Inspect';
						action: #inspectConversation;
						yourself);
				yourself);
		yourself
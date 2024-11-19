toolbuilder
buildButtonBar: builder

	^ builder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children:
			(OrderedCollection new
				addAll:
					((self allRoles copyWithout: (self isDisplayingRawConversation ifFalse: [#system]))
						collect: [:role |
							builder pluggableActionButtonSpec new
								model: self;
								label: ('+{1}' format: {role capitalized});
								help: ('Add {1} message' format: {role});
								action: ('add{1}Message' format: {role capitalized}) asSymbol;
								yourself]);
				add:
					(builder pluggableActionButtonSpec new
						model: self;
						label: #advancedModeLabel;
						action: #toggleAdvancedMode;
						state: #isAdvancedMode;
						yourself);
				add:
					(builder pluggableActionButtonSpec new
						model: self;
						label: #completeCancelLabel;
						enabled: #canCompleteOrCancel;
						help: #helpForCompleteCancel;
						action: #completeOrCancel;
						yourself);
				add:
					(builder pluggableActionButtonSpec new
						model: self;
						label: 'Voice';
						action: #toggleVoiceMode;
						state: #voiceModeEnabled;
						color: #voiceButtonColor;
						yourself);
				yourself);
		yourself
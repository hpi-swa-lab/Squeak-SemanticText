private
assureSpeechAvailableOr: cancelBlock

	| requirementsBlock |
	(SemanticText registeredConversationModels anySatisfy: [:model |
		((model respondsTo: #canUnderstandAudio) and: [model canUnderstandAudio])
			and: [(model respondsTo: #canGenerateAudio) and: [model canGenerateAudio]]]) ifTrue:
				[^ self].
	
	requirementsBlock := [:requirements |
		| alternativeRequirement |
		alternativeRequirement := {#audioConversationModel. 'install audio-capable conversation model'. [SemanticText class browse]}.
		(Project uiManager
			chooseOptionFromLabeledValues: 
				(((requirements copyWithFirst: alternativeRequirement)
					collect: [:requirement | requirement second -> requirement]
					as: OrderedDictionary)
						at: #cancel put: nil;
						yourself)
			title: 'To enable speech, you need to configure SemanticText first.')
				ifNotNil: [:requirement | requirement third value].
		^ cancelBlock value].
	
	SemanticText assureSpeechTranscriptionAvailableOr: requirementsBlock.
	SemanticText assureSpeechSynthesisAvailableOr: requirementsBlock.
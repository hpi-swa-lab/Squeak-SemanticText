private
assureSpeechAvailableOr: cancelBlock

	| requirementsBlock |
	requirementsBlock := [:requirements |
		(Project uiManager
			chooseOptionFromLabeledValues: 
				((requirements
					collect: [:requirement | requirement second -> requirement]
					as: OrderedDictionary)
						at: #cancel put: nil;
						yourself)
			title: 'To enable speech, you need to configure SemanticText first.')
				ifNotNil: [:requirement | requirement third value].
		^ cancelBlock value].
	
	SemanticText assureSpeechTranscriptionAvailableOr: requirementsBlock.
	SemanticText assureSpeechSynthesisAvailableOr: requirementsBlock.
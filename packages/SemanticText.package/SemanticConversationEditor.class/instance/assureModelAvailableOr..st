private
assureModelAvailableOr: cancelBlock

	self conversation model assureAvailableOr: [:requirements |
		(Project uiManager
			chooseOptionFromLabeledValues: 
				((requirements
					collect: [:requirement | requirement second -> requirement]
					as: OrderedDictionary)
						at: #cancel put: nil;
						yourself)
			title: 'To enable conversations, you need to configure SemanticText first.')
				ifNotNil: [:requirement | requirement third value].
		^ cancelBlock value].
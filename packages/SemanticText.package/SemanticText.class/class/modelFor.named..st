registry - generic
modelFor: type named: name

	^ (self registeredModelsFor: type)
		detect: [:ea | ea name = name]
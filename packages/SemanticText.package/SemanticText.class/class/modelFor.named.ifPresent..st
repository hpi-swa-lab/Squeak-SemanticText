registry - generic
modelFor: type named: name ifPresent: aBlock

	^ (self registeredModelsFor: type)
		detect: [:ea | ea name = name]
		ifFound: aBlock
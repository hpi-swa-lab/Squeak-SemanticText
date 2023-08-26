registry - generic
registeredModelsFor: type

	^ self registeredModels at: type ifAbsent: [Set new]
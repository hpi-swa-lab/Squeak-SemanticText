registry - generic
defaultModelOrNilFor: type

	^ self defaultModels at: type ifAbsent: [nil]
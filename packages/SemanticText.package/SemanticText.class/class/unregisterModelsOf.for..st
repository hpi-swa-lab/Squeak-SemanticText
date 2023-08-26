registry - generic
unregisterModelsOf: aClass for: type

	Models ifNil: [^ self].
	(self registeredModels at: type ifAbsent: [^ self])
		select: [:model | model isKindOf: aClass]
		thenDo: [:model | self unregisterModel: model for: type]
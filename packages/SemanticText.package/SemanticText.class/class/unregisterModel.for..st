registry - generic
unregisterModel: aModel for: type

	Models ifNil: [^ self].
	(self registeredModels at: type ifAbsent: [^ self])
		remove: aModel.
	(self defaultModelOrNilFor: type) == aModel
		ifTrue: [self setModel: nil asDefaultFor: type].
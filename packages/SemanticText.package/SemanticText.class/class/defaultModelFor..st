registry - generic
defaultModelFor: type

	^ self defaultModels at: type ifAbsentPut:
		[self chooseModelFor: type]
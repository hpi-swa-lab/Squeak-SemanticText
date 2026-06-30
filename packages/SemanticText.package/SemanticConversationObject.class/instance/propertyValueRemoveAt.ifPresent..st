accessing
propertyValueRemoveAt: aSymbol ifPresent: presentBlock

	^ presentBlock value:
		((self basicProperties ifNil: [^ self])
			removeKey: aSymbol ifAbsent: [^ self])
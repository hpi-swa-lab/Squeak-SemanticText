accessing
propertyValueRemoveAt: aSymbol

	^ self propertyValueRemoveAt: aSymbol ifAbsent:
		[(KeyNotFound key: aSymbol) signal]
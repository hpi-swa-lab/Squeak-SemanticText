accessing
propertyValueRemoveAt: aSymbol ifAbsent: absentBlock

	^ (self basicProperties ifNil: [^ absentBlock value])
		removeKey: aSymbol ifAbsent: absentBlock
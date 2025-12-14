accessing
propertyValueAt: aSymbol ifAbsent: absentBlock

	^ (self basicProperties ifNil: [^ absentBlock value])
		at: aSymbol ifAbsent: absentBlock
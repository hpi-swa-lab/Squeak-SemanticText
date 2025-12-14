accessing
propertyValueAt: aSymbol ifPresent: presentBlock ifAbsent: absentBlock

	^ (self basicProperties ifNil: [^ absentBlock value])
		at: aSymbol ifPresent: presentBlock ifAbsent: absentBlock
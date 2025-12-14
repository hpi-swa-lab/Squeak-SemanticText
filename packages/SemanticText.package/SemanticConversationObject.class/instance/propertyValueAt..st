accessing
propertyValueAt: aSymbol

	^ self propertyValueAt: aSymbol ifAbsent: [(KeyNotFound key: aSymbol) signal]
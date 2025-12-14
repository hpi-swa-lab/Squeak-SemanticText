accessing
propertyValueAt: aSymbol ifPresent: presentBlock

	^ (self basicProperties ifNil: [^ self])
		at: aSymbol ifPresent: presentBlock
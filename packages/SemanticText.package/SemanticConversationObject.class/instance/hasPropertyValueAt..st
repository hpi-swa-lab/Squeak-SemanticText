accessing
hasPropertyValueAt: aSymbol

	^ (self basicProperties ifNil: [^ false])
		includesKey: aSymbol
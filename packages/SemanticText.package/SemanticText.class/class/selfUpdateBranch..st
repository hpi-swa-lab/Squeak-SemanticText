app - self-updating
selfUpdateBranch: aString

	self basicSelfUpdateBranch: aString.
	
	(Project uiManager confirm: 'Would you like to install updates now?' title: ('{1} self-update' format: {self appName}))
		ifTrue: [self selfUpdate].
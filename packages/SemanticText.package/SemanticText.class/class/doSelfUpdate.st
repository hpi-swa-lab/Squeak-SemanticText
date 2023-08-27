app - self-updating
doSelfUpdate

	(Project uiManager confirm: ('Are you sure you would like to install the latest updates for {1}?' withCRs format: {self appName})) ifFalse: [^ false].
	
	self selfUpdate.
	^ true
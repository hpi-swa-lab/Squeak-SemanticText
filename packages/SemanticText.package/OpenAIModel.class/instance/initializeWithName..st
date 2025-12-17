initialize-release
initializeWithName: aString

	super initialize.
	
	self name: aString.
	self account: self defaultAccount.
	self baseConfig: self defaultConfig.
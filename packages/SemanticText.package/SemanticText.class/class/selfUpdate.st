app - self-updating
selfUpdate
	"SemanticText selfUpdate"

	| squeakVersion |
	squeakVersion := SystemVersion current version.
	((Project uiManager
		confirm: ('It is recommended to install the latest updates for {1} first.' format: {squeakVersion})
		title: ('Updating {1}' format: {self appName})
		trueChoice: ('Yes, install latest {1} updates now' format: {'Squeak'})
		falseChoice: ('Skip latest {1} updates (not recommended)' format: {'Squeak'}))
			ifNil: [^ self])
			ifTrue: [MCMcmUpdater default doUpdate: true].
	
	^ self selfUpdateFromMetacello
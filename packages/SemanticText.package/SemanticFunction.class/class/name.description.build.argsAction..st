instance creation
name: name description: description build: buildBlock argsAction: argsAction

	^ (self name: name description: description build: buildBlock)
		argsAction: argsAction;
		yourself
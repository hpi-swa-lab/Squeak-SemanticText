instance creation
name: name description: description build: buildBlock action: action

	^ (self name: name description: description build: buildBlock)
		action: action;
		yourself
instance creation
name: name description: description build: buildBlock

	^ self new
		name: name;
		description: description;
		in: buildBlock;
		yourself
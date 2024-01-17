accessing
addTool: aTool

	self assert: (tools includesKey: aTool name) not.
	tools at: aTool name put: aTool.
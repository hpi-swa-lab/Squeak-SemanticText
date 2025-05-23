accessing
argsAction: argsBlock
	"aBlock will be passed the parameters."

	(argsBlock isSymbol and: [argsBlock isUnary]) ifTrue:
		[^ self argsAction: [:arg | argsBlock value: arg]].
	self action:
		[:args |
			argsBlock valueWithEnoughArguments:
				(self parameters
					collect: [:parameter | args at: parameter name ifAbsent: [nil]]
					as: Array)].
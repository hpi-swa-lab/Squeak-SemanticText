toolbuilder
shortLabelString

	| model |
	model := self conversation model.
	(model class semanticIncludesBehaviorNamed: #OpenAIModel) ifTrue:
		[^ '{1}' format: {self class naiveAppName}].
	^ '{1}' format: {self class appName}
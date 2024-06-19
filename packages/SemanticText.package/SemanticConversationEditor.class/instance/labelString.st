toolbuilder
labelString

	| model |
	model := self conversation model.
	originalLabel isEmptyOrNil ifFalse:
		[^ '{1} ({2})' format: {originalLabel. model name}].
	(model class semanticIncludesBehaviorNamed: #OpenAIModel) ifTrue:
		[^ '{1} ({2})' format: {self class naiveAppName. model name}].
	^ '{1}: {2}' format: {self class appName. model name}
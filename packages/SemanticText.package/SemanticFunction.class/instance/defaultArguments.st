accessing
defaultArguments

	^ self parameters
		collect: [:parameter | parameter defaultValue]
		as: OrderedJsonObject
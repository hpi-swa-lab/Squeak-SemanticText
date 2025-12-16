initialize-release
onInitialResult: aBlock

	publishBlock := [:value |
		aBlock value: value.
		publishBlock := nil.
		value].